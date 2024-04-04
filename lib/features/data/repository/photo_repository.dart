import 'dart:io';

import 'package:retrofit/dio.dart';
import 'package:photostock/core/constants/constants.dart';
import 'package:photostock/core/resources/data_state.dart';
import 'package:photostock/features/data/data_sources/remote/photo_api_service.dart';
import 'package:photostock/features/domain/entities/photo_entity.dart';
import 'package:photostock/features/domain/repository/photo_repository.dart';

class PhotoRepositoryImpl extends PhotoRepository {
  final PhotoApiService _photoApiService;

  PhotoRepositoryImpl(this._photoApiService);

  @override
  Future<HttpResponse<List<PhotoEntity>>> getPhotos(
      {String clientId = '', int page = 1}) async {
       return _photoApiService.getPhotos(
          clientId: clientId, page: page.toString());
  }
}
