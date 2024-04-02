import 'dart:io';

import 'package:dio/dio.dart';
import 'package:photostock/core/constants/constants.dart';
import 'package:photostock/core/resources/data_state.dart';
import 'package:photostock/features/data/data_sources/remote/photo_api_service.dart';
import 'package:photostock/features/domain/entities/photo_entity.dart';
import 'package:photostock/features/domain/repository/photo_repository.dart';

class PhotoRepositoryImpl extends PhotoRepository {
  final PhotoApiService _photoApiService;

  PhotoRepositoryImpl(this._photoApiService);

  @override
  Future<DataState<List<PhotoEntity>>> getPhotos(
      {String? clientId, int? page}) async {
    try {
      page = page ?? 1;
      final httpResponse = await _photoApiService.getPhotos(
          clientId: clientId, page: page.toString());
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
