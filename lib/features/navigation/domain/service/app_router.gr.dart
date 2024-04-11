// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    PhotoDetailRoute.name: (routeData) {
      final args = routeData.argsAs<PhotoDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: PhotoDetailFlow(
          key: args.key,
          photoEntity: args.photoEntity,
        )),
      );
    },
    PhotoFavRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const PhotoFavFlow()),
      );
    },
    PhotoListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const PhotoListFlow()),
      );
    },
  };
}

/// generated route for
/// [PhotoDetailFlow]
class PhotoDetailRoute extends PageRouteInfo<PhotoDetailRouteArgs> {
  PhotoDetailRoute({
    Key? key,
    required PhotoEntity photoEntity,
    List<PageRouteInfo>? children,
  }) : super(
          PhotoDetailRoute.name,
          args: PhotoDetailRouteArgs(
            key: key,
            photoEntity: photoEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'PhotoDetailRoute';

  static const PageInfo<PhotoDetailRouteArgs> page =
      PageInfo<PhotoDetailRouteArgs>(name);
}

class PhotoDetailRouteArgs {
  const PhotoDetailRouteArgs({
    this.key,
    required this.photoEntity,
  });

  final Key? key;

  final PhotoEntity photoEntity;

  @override
  String toString() {
    return 'PhotoDetailRouteArgs{key: $key, photoEntity: $photoEntity}';
  }
}

/// generated route for
/// [PhotoFavFlow]
class PhotoFavRoute extends PageRouteInfo<void> {
  const PhotoFavRoute({List<PageRouteInfo>? children})
      : super(
          PhotoFavRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhotoFavRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PhotoListFlow]
class PhotoListRoute extends PageRouteInfo<void> {
  const PhotoListRoute({List<PageRouteInfo>? children})
      : super(
          PhotoListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhotoListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
