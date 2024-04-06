import 'dart:async';

import 'package:bloc/bloc.dart';
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

  final List<PhotoEntity> _loadedPhotos = [];
  int _defaultPage = 1;

  RemotePhotoBloc(this._photoRepository) : super(const RemotePhotoLoading([])) {
    on<GetPhotos>(onGetPhotos);
  }

  void onGetPhotos(GetPhotos event, Emitter<RemotePhotoState> emit) async {
    emit(RemotePhotoLoading(_loadedPhotos));
    try {
      final result = await _photoRepository.getPhotos(
          clientId: defaultClientId, page: _defaultPage);

      if (result.response.statusCode == 200) {
        _defaultPage += 1;
        _loadedPhotos.addAll(result.data);
        emit(RemotePhotoSuccess(_loadedPhotos, _defaultPage));
      }

    } on DioException catch (e) {
      emit(RemotePhotoError(_loadedPhotos, e));
    }
  }
}
