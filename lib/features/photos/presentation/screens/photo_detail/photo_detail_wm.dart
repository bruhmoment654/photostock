import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/photos/di/photo_list_scope.dart';
import 'package:photostock/features/photos/domain/entities/photo_entity.dart';
import 'package:photostock/features/photos/presentation/screens/photo_detail/photo_detail_model.dart';
import 'package:photostock/features/photos/presentation/screens/photo_detail/photo_detail_screen.dart';
import 'package:provider/provider.dart';

PhotoDetailWM defaultPhotoDetailWMFactory(BuildContext context) {
  final scope = context.read<IPhotoScope>();

  return PhotoDetailWM(PhotoDetailModel(
      photoEntity: const PhotoEntity(), repository: scope.localRepository));
}

abstract interface class IPhotoDetailWM implements IWidgetModel {
  PhotoEntity get photoEntity;

  ThemeData get theme;

  Animation<Color?> get animation;

  AnimationController get controller;

  void onClickBack();

  void onClickLike();
}

final class PhotoDetailWM
    extends WidgetModel<PhotoDetailScreen, PhotoDetailModel>
    with SingleTickerProviderWidgetModelMixin
    implements IPhotoDetailWM {
  PhotoDetailWM(super.model);

  late AnimationController _controller;
  late Animation<Color?> _animation;

  @override
  void initWidgetModel() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _animation =
        ColorTween(begin: Colors.white, end: Colors.pink).animate(_controller);

    super.initWidgetModel();

    if (model.hasEntity()) {
      _controller.forward();
    }
  }

  @override
  ThemeData get theme => Theme.of(context);

  @override
  Animation<Color?> get animation => _animation;

  @override
  AnimationController get controller => _controller;

  @override
  void onClickBack() {
    context.router.back();
  }

  @override
  void onClickLike() async {
    if (model.savedEntities.contains(model.photoEntity)) {
      model.removeEntity();
      controller.reverse();
    } else {
      model.saveEntity();
      controller.forward();
    }
  }

  @override
  PhotoEntity get photoEntity => model.photoEntity;
}

const String likedPhotos = 'LIKED_PHOTOS';
