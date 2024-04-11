import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:photostock/common/widgets/di_scope.dart';
import 'package:photostock/features/photos/presentation/screens/photo_fav/photo_fav_screen.dart';

import '../../../di/photo_list_scope.dart';

@RoutePage()
class PhotoFavFlow extends StatelessWidget implements AutoRouteWrapper {
  const PhotoFavFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return const PhotoFavScreen();
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
