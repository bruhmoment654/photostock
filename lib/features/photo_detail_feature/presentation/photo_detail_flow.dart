import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:photostock/features/photo_detail_feature/presentation/photo_detail_screen.dart';

import '../../../common/widgets/di_scope.dart';
import '../../photo_list_feature/di/photo_list_scope.dart';
import '../../photo_list_feature/domain/entities/photo_entity.dart';

@RoutePage()
class PhotoDetailFlow extends StatelessWidget implements AutoRouteWrapper {
  final PhotoEntity photoEntity;

  const PhotoDetailFlow({super.key, required this.photoEntity});

  @override
  Widget build(BuildContext context) {
    return PhotoDetailScreen(photoEntity: photoEntity);
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return DiScope<IPhotoListScope>(
      onFactory: PhotoListScope.create,
      onDispose: (scope) => scope.dispose(),
      child: this,
    );
  }
}
