import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/navigation/domain/service/app_router.dart';
import 'package:photostock/features/photos/di/photo_list_scope.dart';
import 'package:photostock/features/photos/domain/entities/photo_entity.dart';
import 'package:photostock/features/photos/presentation/screens/photo_list/photo_list_model.dart';
import 'package:photostock/features/photos/presentation/screens/photo_list/photo_list_screen.dart';
import 'package:photostock/features/theme_mode/presentation/theme_mode_provider.dart';
import 'package:photostock/features/theme_mode/presentation/theme_mode_widget.dart';
import 'package:provider/provider.dart';
import 'package:union_state/union_state.dart';

PhotoListWM defaultPhotoWMFactory(BuildContext context) {
  final scope = context.read<IPhotoScope>();
  return PhotoListWM(PhotoListModel(
    repository: scope.remoteRepository,
  ));
}

abstract interface class IPhotoListWM implements IWidgetModel {
  double get width;

  PhotoStateListener get state;

  ScrollController get controller;

  ThemeData get theme;

  AnimationController get animationController;

  Animation<double> get loadingAnimation;

  Animation<double> get errorAnimation;

  void onTileTap(PhotoEntity entity);

  void refresh();

  void onFavIconTap();

  void kappa();
}

final class PhotoListWM extends WidgetModel<PhotoListScreen, PhotoListModel>
    with SingleTickerProviderWidgetModelMixin
    implements IPhotoListWM {
  PhotoListWM(super._model);

  late AnimationController _animationController;
  @override
  late Animation<double> loadingAnimation;
  @override
  late Animation<double> errorAnimation;

  void _handleScrollChange() {
    if (controller.position.extentAfter <= 10) {
      refresh();
    }
  }

  void _handlePositionAttach(ScrollPosition position) {
    position.isScrollingNotifier.addListener(_handleScrollChange);
  }

  void _handlePositionDetach(ScrollPosition position) {
    position.isScrollingNotifier.removeListener(_handleScrollChange);
  }

  @override
  PhotoStateListener get state => model.state;

  @override
  AnimationController get animationController => _animationController;

  @override
  late ScrollController controller;

  @override
  double get width => MediaQuery.of(context).size.width;

  @override
  void initWidgetModel() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    loadingAnimation =
        Tween(begin: 1.0, end: 0.0).animate(_animationController);
    errorAnimation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    controller = ScrollController(
        onAttach: _handlePositionAttach, onDetach: _handlePositionDetach);
    model.getPhotos();
    state.addListener(_errorListener);

    super.initWidgetModel();
  }

  @override
  void refresh() async {
    animationController.value = 0;
    await model.getPhotos();
  }

  @override
  void onTileTap(PhotoEntity photoEntity) {
    context.router.push(PhotoDetailRoute(photoEntity: photoEntity));
  }

  @override
  void onFavIconTap() {
    context.router.push(const PhotoFavRoute());
  }

  void kappa() async{
    await ThemeModeProvider.of(context).switchThemeMode();
  }

  @override
  ThemeData get theme => Theme.of(context);

  void _errorListener() {
    if (state.value is UnionStateFailure) {
      if (state.value.data!.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  'Connection error. Check your internet connection and try again')),
        );
      }
    }
    if (state.value.data!.isEmpty) {
      _animationController.forward();
    }
  }
}
