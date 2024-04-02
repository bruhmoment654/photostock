import 'package:dio/dio.dart';
import 'package:photostock/core/constants/constants.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/photo_model.dart';
part 'photo_api_service.g.dart';

@RestApi(baseUrl: basePhotosApiUrl)
abstract class PhotoApiService {
  factory PhotoApiService(Dio dio) = _PhotosApiService;

  @GET('/photos')
  Future<HttpResponse<List<PhotoModel>>> getPhotos(
      {@Query('client_id') String? clientId, @Query('page') String? page});
}
