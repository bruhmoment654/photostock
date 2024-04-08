import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/navigation/domain/service/app_router.dart';
import 'package:photostock/features/photo_detail_feature/presentation/photo_detail_screen.dart';
import 'package:photostock/features/photo_list_feature/di/photo_list_scope.dart';
import 'package:photostock/features/photo_list_feature/domain/entities/photo_entity.dart';
import 'package:photostock/features/photo_list_feature/presentation/photo_list_model.dart';
import 'package:photostock/features/photo_list_feature/presentation/photo_list_screen.dart';
import 'package:photostock/features/photo_list_feature/presentation/remote_photo_state.dart';
import 'package:provider/provider.dart';

PhotoListWM defaultPhotoWMFactory(BuildContext context) {
  final scope = context.read<IPhotoListScope>();
  return PhotoListWM(PhotoListModel(
    repository: scope.repository,
  ));
}

abstract interface class IPhotoListWM implements IWidgetModel {
  ValueListenable<RemotePhotoState> get state;

  ScrollController get controller;

  ThemeData get theme;

  void onTapCard(PhotoEntity entity);

  void getPhotos();

  void onError();
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
  ValueListenable<RemotePhotoState> get state => model.state;

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
  getPhotos() async {
    await model.getPhotos();

    if (state.value is RemotePhotoError){
      onError();
    }
  }

  @override
  void onTapCard(PhotoEntity photoEntity) {
    context.router.push(PhotoDetailRoute(photoEntity: photoEntity));
  }

  @override
  void onError()  {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error while loading data')));
  }

  @override
  ThemeData get theme => Theme.of(context);
}
