import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:photostock/core/constants/constants.dart';
import 'package:photostock/features/photos/domain/repository/i_photo_repository.dart';
import 'package:union_state/union_state.dart';

import '../../../domain/entities/photo_entity.dart';



typedef PhotoStateNotifier = UnionStateNotifier<List<PhotoEntity>>;
typedef PhotoStateListener = ValueListenable<UnionState<List<PhotoEntity>>>;

final class PhotoListModel extends ElementaryModel {
  final IRemotePhotoRepository _repository;

  final _state = PhotoStateNotifier([]);

  PhotoStateListener get state => _state;
  final List<PhotoEntity> _loadedPhotos = [];
  int _defaultPage = 1;

  PhotoListModel({
    required IRemotePhotoRepository repository,
  }) : _repository = repository;

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }

  Future<void> getPhotos() async {
    _state.loading(_loadedPhotos);

    try {
      final result = await _repository.getPhotos(
          clientId: defaultClientId, page: _defaultPage);

      if (result.response.statusCode == 200) {
        _defaultPage += 1;
        //for test cases, where data length may be <= 8
        final toAdd = result.data.length <= 8 ? result.data : result.data.getRange(0, 8);
        _loadedPhotos.addAll(toAdd);
        _state.content(_loadedPhotos);
      }
    } on DioException catch (e) {
      _state.failure(e, _loadedPhotos);
    }
  }
}
