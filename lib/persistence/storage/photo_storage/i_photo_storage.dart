import 'package:photostock/features/photos/domain/entities/photo_entity.dart';

abstract interface class IPhotoStorage {
  List<String> getPhotos();

  Future<void> savePhotos(List<PhotoEntity> photos);
}
