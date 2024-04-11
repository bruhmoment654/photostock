import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:photostock/common/utils/extentions/value_notifier_x.dart';
import 'package:photostock/features/photos/domain/entities/photo_entity.dart';
import 'package:photostock/features/photos/domain/repository/i_photo_local_repository.dart';

final class PhotoFavModel extends ElementaryModel {
  final _state = ValueNotifier<List<PhotoEntity>>([]);
  final ILocalPhotoRepository _repository;

  ValueListenable<List<PhotoEntity>> get state => _state;

  void getAllEntities() {
    _state.emit(_repository.getPhotos());
  }

  PhotoFavModel(this._repository);
}
