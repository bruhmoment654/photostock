import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:photostock/features/photos/presentation/screens/photo_detail/photo_detail_screen.dart';

import '../../../../../common/widgets/di_scope.dart';
import '../../../di/photo_list_scope.dart';
import '../../../domain/entities/photo_entity.dart';

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
