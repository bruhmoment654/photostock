import 'package:retrofit/dio.dart';

import '../../../../api/service/photo_api_service.dart';
import '../../domain/entities/photo_entity.dart';
import '../../domain/repository/i_photo_repository.dart';

class RemotePhotoRepositoryImpl extends IRemotePhotoRepository {
  final PhotoApi _photoApiService;

  RemotePhotoRepositoryImpl(this._photoApiService);

  @override
  Future<HttpResponse<List<PhotoEntity>>> getPhotos(
      {String clientId = '', int page = 1}) async {
    return _photoApiService.getPhotos(
        clientId: clientId, page: page.toString());
  }
}
