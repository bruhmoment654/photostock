import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/navigation/domain/entity/app_route_paths.dart';

import '../../../photos/domain/entities/photo_entity.dart';
import '../../../photos/presentation/screens/photo_detail/photo_detail_flow.dart';
import '../../../photos/presentation/screens/photo_fav/photo_fav_flow.dart';
import '../../../photos/presentation/screens/photo_list/photo_list_flow.dart';
import '../../../root_screen/presentation/root_screen.dart';
import '../../../settings/presentation/settings_flow.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Flow,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: RootScreenRoute.page,
          path: AppRoutePaths.rootScreenPath,
        ),
        AutoRoute(
          page: PhotoListRoute.page,
          path: AppRoutePaths.photosHomePath,
        ),
        AutoRoute(
          page: PhotoDetailRoute.page,
          path: AppRoutePaths.photoDetailPath,
        ),
        AutoRoute(
          page: PhotoFavRoute.page,
          path: AppRoutePaths.photoFavPath,
        )
      ];
}
