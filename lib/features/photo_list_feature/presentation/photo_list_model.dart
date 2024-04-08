import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:photostock/common/utils/extentions/value_notifier_x.dart';
import 'package:photostock/core/constants/constants.dart';
import 'package:photostock/features/photo_list_feature/domain/repository/photo_repository.dart';
import 'package:photostock/features/photo_list_feature/presentation/remote_photo_state.dart';

import '../domain/entities/photo_entity.dart';

final class PhotoListModel extends ElementaryModel {
  final IPhotoRepository _repository;

  final _state = ValueNotifier<RemotePhotoState>(const RemotePhotoLoading([]));

  ValueListenable<RemotePhotoState> get state => _state;
  final List<PhotoEntity> _loadedPhotos = [];
  int _defaultPage = 1;

  PhotoListModel({
    required IPhotoRepository repository,
  }) : _repository = repository;

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }

  Future<void> getPhotos() async {
    _state.emit(RemotePhotoLoading(_loadedPhotos));
    try {
      final result = await _repository.getPhotos(
          clientId: defaultClientId, page: _defaultPage);

      if (result.response.statusCode == 200) {
        _defaultPage += 1;
        _loadedPhotos.addAll(result.data);
        _state.emit(RemotePhotoSuccess(_loadedPhotos, _defaultPage));
      }

    } on DioException catch (e) {
      _state.emit(RemotePhotoError(_loadedPhotos, e));
    }
  }
}
