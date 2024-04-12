import '../entities/photo_entity.dart';

abstract interface class ILocalPhotoRepository {
  List<PhotoEntity> getPhotos();

  Future<void> savePhotos(List<PhotoEntity> entities);
}
