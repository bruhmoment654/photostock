import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:photostock/common/widgets/di_scope.dart';
import 'package:photostock/features/photos/di/photo_list_scope.dart';
import 'package:photostock/features/photos/presentation/screens/photo_list/photo_list_screen.dart';


@RoutePage()
class PhotoListFlow extends StatelessWidget implements AutoRouteWrapper {
  const PhotoListFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return const PhotoListScreen();
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
