import 'dart:convert';

import 'package:photostock/features/photos/domain/entities/photo_entity.dart';
import 'package:photostock/features/photos/domain/repository/i_photo_local_repository.dart';

import '../../../../persistence/storage/photo_storage/i_photo_storage.dart';

class LocalPhotoRepository implements ILocalPhotoRepository {
  final IPhotoStorage _storage;

  const LocalPhotoRepository(this._storage);

  @override
  List<PhotoEntity> getPhotos() {
    final photos = _storage.getPhotos();

    return photos
        .map((photo) => PhotoEntity.fromLocalJson(
            jsonDecode(photo) as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> savePhotos(List<PhotoEntity> entities) {
    return _storage.savePhotos(entities);
  }
}
