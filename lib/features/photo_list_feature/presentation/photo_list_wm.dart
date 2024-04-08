import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/navigation/domain/service/app_router.dart';
import 'package:photostock/features/photo_list_feature/di/photo_list_scope.dart';
import 'package:photostock/features/photo_list_feature/domain/entities/photo_entity.dart';
import 'package:photostock/features/photo_list_feature/presentation/photo_list_model.dart';
import 'package:photostock/features/photo_list_feature/presentation/photo_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:union_state/union_state.dart';
import 'package:photostock/uikit/snacks/data_load_error_snackbar.dart';

PhotoListWM defaultPhotoWMFactory(BuildContext context) {
  final scope = context.read<IPhotoListScope>();
  return PhotoListWM(PhotoListModel(
    repository: scope.repository,
  ));
}

abstract interface class IPhotoListWM implements IWidgetModel {
  PhotoStateNotifier get state;

  ScrollController get controller;

  ThemeData get theme;

  void onTapCard(PhotoEntity entity);

  void getPhotos();
}

final class PhotoListWM extends WidgetModel<PhotoListScreen, PhotoListModel>
    implements IPhotoListWM {
  PhotoListWM(super._model);

  void _handleScrollChange() {
    if (controller.position.extentAfter <= 10) {
      getPhotos();
    }
  }

  void _handlePositionAttach(ScrollPosition position) {
    position.isScrollingNotifier.addListener(_handleScrollChange);
  }

  void _handlePositionDetach(ScrollPosition position) {
    position.isScrollingNotifier.removeListener(_handleScrollChange);
  }

  @override
  PhotoStateNotifier get state => model.state;

  @override
  late ScrollController controller;

  @override
  void initWidgetModel() {
    controller = ScrollController(
        onAttach: _handlePositionAttach, onDetach: _handlePositionDetach);
    model.getPhotos();

    super.initWidgetModel();
  }

  @override
  void getPhotos() async {
    await model.getPhotos();
    if (state.value is UnionStateFailure) {
      _onError();
    }
  }

  @override
  void onTapCard(PhotoEntity photoEntity) {
    context.router.push(PhotoDetailRoute(photoEntity: photoEntity));
  }

  @override
  ThemeData get theme => Theme.of(context);

  void _onError() {
    ScaffoldMessenger.of(context).showSnackBar(dataLoadErrorSnackBar);
  }
}
