import 'package:retrofit/dio.dart';

import '../../../../api/service/photo_api_service.dart';
import '../../domain/entities/photo_entity.dart';
import '../../domain/repository/photo_repository.dart';

class PhotoRepositoryImpl extends IPhotoRepository {
  final PhotoApi _photoApiService;

  PhotoRepositoryImpl(this._photoApiService);

  @override
  Future<HttpResponse<List<PhotoEntity>>> getPhotos(
      {String clientId = '', int page = 1}) async {
    return _photoApiService.getPhotos(
        clientId: clientId, page: page.toString());
  }
}
