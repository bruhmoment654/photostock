import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:photostock/common/widgets/di_scope.dart';
import 'package:photostock/features/photo_list_feature/di/photo_list_scope.dart';
import 'package:photostock/features/photo_list_feature/presentation/photo_list_screen.dart';

@RoutePage()
class PhotoListFlow extends StatelessWidget implements AutoRouteWrapper {
  const PhotoListFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return const PhotoListScreen();
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
