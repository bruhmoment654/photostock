import 'package:photostock/features/domain/entities/photo_entity.dart';
import 'package:retrofit/dio.dart';

abstract class PhotoRepository{

Future<HttpResponse<List<PhotoEntity>>> getPhotos({String clientId, int page});
}