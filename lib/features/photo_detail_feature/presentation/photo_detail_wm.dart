import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/photo_detail_feature/presentation/photo_detail_model.dart';
import 'package:photostock/features/photo_detail_feature/presentation/photo_detail_screen.dart';

PhotoDetailWM defaultPhotoDetailWMFactory(BuildContext context) {
  return PhotoDetailWM(PhotoDetailModel());
}

abstract interface class IPhotoDetailWM implements IWidgetModel {
  ThemeData get theme;

  void onBackBtnPressed();
}

final class PhotoDetailWM
    extends WidgetModel<PhotoDetailScreen, PhotoDetailModel>
    implements IPhotoDetailWM {
  PhotoDetailWM(super._model);

  @override
  get theme => Theme.of(context);

  @override
  void onBackBtnPressed() {
    context.router.pop();
  }
}
