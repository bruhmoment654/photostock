import 'dart:io';

import 'package:dio/dio.dart';
import 'package:photostock/core/resources/data_state.dart';
import 'package:photostock/core/usecase/use_case.dart';
import 'package:photostock/features/domain/entities/photo_entity.dart';
import 'package:photostock/features/domain/repository/photo_repository.dart';

class GetPhotosRemoteUseCase
    extends UseCase<DataState<List<PhotoEntity>>, (String, int)> {
  final PhotoRepository _photoRepository;

  GetPhotosRemoteUseCase(this._photoRepository);

  @override
  Future<DataState<List<PhotoEntity>>> call(
      {(String, int) params = ('', 1)}) async {
    try {
      final httpResponse = await _photoRepository.getPhotos(
          clientId: params.$1, page: params.$2);

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
