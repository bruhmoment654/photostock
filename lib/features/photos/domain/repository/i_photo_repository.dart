import 'package:retrofit/dio.dart';

import '../entities/photo_entity.dart';

abstract class IRemotePhotoRepository {
  Future<HttpResponse<List<PhotoEntity>>> getPhotos(
      {String clientId, int page});
}
