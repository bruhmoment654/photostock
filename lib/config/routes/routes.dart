import 'package:go_router/go_router.dart';
import 'package:photostock/features/domain/entities/photo_entity.dart';
import 'package:photostock/features/presentation/pages/photo_detail_screen.dart';
import 'package:photostock/features/presentation/pages/photos_list_screen.dart';

final router = GoRouter(routes: <GoRoute>[
  GoRoute(
      name: 'photos_home',
      path: '/',
      builder: (context, state) => const PhotosListScreen()),
  GoRoute(
      name: 'photo',
      path: '/photo',
      builder: (context, state) =>
          PhotoDetailScreen(photoEntity: state.extra as PhotoEntity)),
]);
