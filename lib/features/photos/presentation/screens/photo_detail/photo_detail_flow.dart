import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:photostock/features/photos/presentation/screens/photo_detail/photo_detail_model.dart';
import 'package:photostock/features/photos/presentation/screens/photo_detail/photo_detail_screen.dart';
import 'package:photostock/features/photos/presentation/screens/photo_detail/photo_detail_wm.dart';
import 'package:provider/provider.dart';

import '../../../../../common/widgets/di_scope.dart';
import '../../../di/photo_list_scope.dart';
import '../../../domain/entities/photo_entity.dart';

@RoutePage()
class PhotoDetailFlow extends StatelessWidget implements AutoRouteWrapper {
  final PhotoEntity photoEntity;

  const PhotoDetailFlow({super.key, required this.photoEntity});

  @override
  Widget build(BuildContext context) {
    return PhotoDetailScreen(
        wmFactory: (_) => PhotoDetailWM(PhotoDetailModel(
            photoEntity: photoEntity,
            repository: context.read<IPhotoScope>().localRepository)));
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return DiScope<IPhotoScope>(
      onFactory: PhotoScope.create,
      onDispose: (scope) => scope.dispose(),
      child: this,
    );
  }
}
