import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/photos/di/photo_list_scope.dart';
import 'package:photostock/features/photos/domain/entities/photo_entity.dart';
import 'package:photostock/features/photos/presentation/screens/photo_fav/photo_fav_model.dart';
import 'package:photostock/features/photos/presentation/screens/photo_fav/photo_fav_screen.dart';
import 'package:provider/provider.dart';

import '../../../../navigation/domain/service/app_router.dart';

PhotoFavWM defaultPhotoFavWM(BuildContext context) {
  final scope = context.read<IPhotoScope>();
  return PhotoFavWM(PhotoFavModel(scope.localRepository));
}

abstract interface class IPhotoFavWM implements IWidgetModel {
  ValueListenable<List<PhotoEntity>> get state;

  ThemeData get theme;

  void onTileTap(PhotoEntity entity);

  void onBackTap();
}

final class PhotoFavWM extends WidgetModel<PhotoFavScreen, PhotoFavModel>
    implements IPhotoFavWM {
  PhotoFavWM(super.model);

  @override
  void initWidgetModel() {
    model.getAllEntities();
    super.initWidgetModel();
  }

  @override
  ValueListenable<List<PhotoEntity>> get state => model.state;

  @override
  void onTileTap(PhotoEntity entity) {
    context.router.push(PhotoDetailRoute(photoEntity: entity));
  }

  @override
  void onBackTap() {
    context.router.back();
  }

  @override
  ThemeData get theme => Theme.of(context);
}
