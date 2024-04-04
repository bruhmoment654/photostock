import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photostock/core/constants/constants.dart';

import '../../domain/entities/photo_entity.dart';
import '../../domain/repository/photo_repository.dart';

part 'remote_photo_event.dart';

part 'remote_photo_state.dart';

class RemotePhotoBloc extends Bloc<RemotePhotoEvent, RemotePhotoState> {
  final PhotoRepository _photoRepository;

  RemotePhotoSuccess? _lastSuccess;
  int defaultPage = 1;

  RemotePhotoBloc(this._photoRepository) : super(const RemotePhotoLoading()) {
    on<GetPhotos>(onGetPhotos);
  }

  void onGetPhotos(GetPhotos event, Emitter<RemotePhotoState> emit) async {
    try {
      List<PhotoEntity>? photos = [];
      int? page = event.page;
      String clientId = event.clientId;

      page ??= defaultPage;

      final result =
          await _photoRepository.getPhotos(clientId: clientId, page: page);
      photos.addAll(_lastSuccess?.photos ?? []);
      if (result.response.statusCode == 200) {
        defaultPage += 1;
        photos.addAll(result.data);
        _lastSuccess = RemotePhotoSuccess(photos, clientId, page);
        emit(_lastSuccess!);
      }
    } on DioException catch (e) {
      emit(RemotePhotoError(e));
    }
  }
}
