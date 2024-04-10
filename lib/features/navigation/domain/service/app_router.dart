import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/navigation/domain/entity/app_route_paths.dart';

import '../../../photo_detail_feature/presentation/photo_detail_flow.dart';
import '../../../photo_list_feature/domain/entities/photo_entity.dart';
import '../../../photo_list_feature/presentation/photo_list_flow.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Flow,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: PhotoListRoute.page,
            path: AppRoutePaths.photosHomePath,
            initial: true),
        AutoRoute(
          page: PhotoDetailRoute.page,
          path: AppRoutePaths.photoDetailPath,
        )
      ];
}
