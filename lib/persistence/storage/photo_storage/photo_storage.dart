import 'package:photostock/persistence/storage/photo_storage/i_photo_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../features/photos/domain/entities/photo_entity.dart';

final class PhotoStorage implements IPhotoStorage {
  final SharedPreferences _prefs;

  const PhotoStorage(this._prefs);

  @override
  List<String> getPhotos() =>
      _prefs.getStringList(PhotoStorageKeys.photos.keyString) ?? [];

  @override
  Future<void> savePhotos(List<PhotoEntity> entities) {
   return _prefs.setStringList(PhotoStorageKeys.photos.keyString,
        entities.map((e) => e.toString()).toList());
  }
}

enum PhotoStorageKeys {
  photos('PHOTOS');

  final String keyString;

  const PhotoStorageKeys(this.keyString);
}
