import 'package:retrofit/dio.dart';

import '../entities/photo_entity.dart';

abstract class IPhotoRepository{

Future<HttpResponse<List<PhotoEntity>>> getPhotos({String clientId, int page});
}