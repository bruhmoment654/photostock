import 'package:dio/dio.dart';
import 'package:photostock/core/constants/constants.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/photos/domain/entities/photo_entity.dart';

part 'photo_api_service.g.dart';

@RestApi(baseUrl: basePhotosApiUrl)
abstract class PhotoApi {
  factory PhotoApi(Dio dio) = _PhotoApi;

  @GET('/photos')
  Future<HttpResponse<List<PhotoEntity>>> getPhotos(
      {@Query('client_id') String? clientId, @Query('page') String? page});
}
