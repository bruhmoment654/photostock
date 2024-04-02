import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:photostock/core/resources/data_state.dart';

import '../../domain/entities/photo_entity.dart';
import '../../domain/usecases/get_photos_remote_usecase.dart';

part 'remote_photo_event.dart';

part 'remote_photo_state.dart';

class RemotePhotoBloc extends Bloc<RemotePhotoEvent, RemotePhotoState> {
  final GetPhotosRemoteUseCase _getPhotosRemoteUseCase;

  RemotePhotoBloc(this._getPhotosRemoteUseCase)
      : super(const RemotePhotoLoading()) {
    on<GetPhotos>(onGetPhotos);
  }

  void onGetPhotos(GetPhotos event, Emitter<RemotePhotoState> emit) async {
    final dataState =
        await _getPhotosRemoteUseCase(params: event.requestParams);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemotePhotoSuccess(dataState.data!));
    }

    if (dataState is DataFailed || dataState.data!.isEmpty) {
      emit(RemotePhotoError(dataState.exception!));
    }
  }
}
