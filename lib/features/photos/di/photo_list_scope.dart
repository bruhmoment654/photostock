import 'package:flutter/cupertino.dart';
import 'package:photostock/api/service/photo_api_service.dart';
import 'package:photostock/common/utils/disposable_object/disposable_object.dart';
import 'package:photostock/features/photos/data/repository/local_photo_repository.dart';
import 'package:photostock/features/photos/data/repository/remote_photo_repository.dart';
import 'package:photostock/features/photos/domain/repository/i_photo_local_repository.dart';
import 'package:photostock/features/photos/domain/repository/i_photo_repository.dart';
import 'package:provider/provider.dart';

import '../../../common/utils/disposable_object/i_disposable_object.dart';
import '../../app/di/app_scope.dart';

final class PhotoScope extends DisposableObject implements IPhotoScope {
  @override
  final IRemotePhotoRepository remoteRepository;
  @override
  final ILocalPhotoRepository localRepository;

  factory PhotoScope.create(BuildContext context) {
    final appScope = context.read<IAppScope>();
    return PhotoScope(RemotePhotoRepositoryImpl(PhotoApi(appScope.dio)),
        LocalPhotoRepository(appScope.photoStorage));
  }

  PhotoScope(this.remoteRepository, this.localRepository);
}

abstract interface class IPhotoScope implements IDisposableObject {
  /// FeatureExampleRepository.
  IRemotePhotoRepository get remoteRepository;

  ILocalPhotoRepository get localRepository;
}
