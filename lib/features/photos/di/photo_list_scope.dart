import 'package:flutter/cupertino.dart';
import 'package:photostock/api/service/photo_api_service.dart';
import 'package:photostock/common/utils/disposable_object/disposable_object.dart';
import 'package:photostock/features/photos/data/repository/photo_repository.dart';
import 'package:photostock/features/photos/domain/repository/photo_repository.dart';
import 'package:provider/provider.dart';

import '../../../common/utils/disposable_object/i_disposable_object.dart';
import '../../app/di/app_scope.dart';

final class PhotoListScope extends DisposableObject implements IPhotoListScope {
  @override
  final IPhotoRepository repository;

  factory PhotoListScope.create(BuildContext context) {
    final appScope = context.read<IAppScope>();
    return PhotoListScope(PhotoRepositoryImpl(PhotoApi(appScope.dio)));
  }

  PhotoListScope(this.repository);
}

abstract interface class IPhotoListScope implements IDisposableObject {
  /// FeatureExampleRepository.
  IPhotoRepository get repository;
}
