import 'package:elementary/elementary.dart';
import 'package:photostock/features/photos/domain/entities/photo_entity.dart';

import '../../../domain/repository/i_photo_local_repository.dart';

final class PhotoDetailModel extends ElementaryModel {
  final PhotoEntity photoEntity;

  late List<PhotoEntity> _savedEntities;
  final ILocalPhotoRepository _repository;

  List<PhotoEntity> get savedEntities => _savedEntities;

  @override
  void init() {
    _savedEntities = _repository.getPhotos();
    super.init();
  }

  bool hasEntity() {
    return _savedEntities.contains(photoEntity);
  }

  void saveEntity() {
    _savedEntities.add(photoEntity);
    _repository.savePhotos(_savedEntities);
  }

  void removeEntity() {
    _savedEntities = _savedEntities
        .where((element) => element.id != photoEntity.id)
        .toList();
    _repository.savePhotos(_savedEntities);
  }

  List<PhotoEntity> getAllEntities() {
    return _savedEntities;
  }

  PhotoDetailModel(
      {required this.photoEntity, required ILocalPhotoRepository repository})
      : _repository = repository;
}
