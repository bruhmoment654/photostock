import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:photostock/core/constants/constants.dart';
import 'package:photostock/features/photos/data/repository/local_photo_repository.dart';
import 'package:photostock/features/photos/domain/entities/photo_entity.dart';
import 'package:photostock/features/photos/presentation/screens/photo_detail/photo_detail_model.dart';
import 'package:photostock/features/photos/presentation/screens/photo_detail/photo_detail_screen.dart';
import 'package:photostock/features/photos/presentation/screens/photo_detail/photo_detail_wm.dart';
import 'package:photostock/persistence/storage/photo_storage/photo_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../util/fake_path_provider.dart';

void main() async {
  PathProviderPlatform.instance = FakePathProviderPlatform();

  TestWidgetsFlutterBinding.ensureInitialized();
  const photoEntity = PhotoEntity(
      id: '2',
      username: 'TEST',
      likes: 999,
      blurHash: defaultHash,
      color: '#FFFFFFFF',
      imageUri:
          'https://images.unsplash.com/photo-1712334636720-ba4c9fd582bb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzMzE5MXwwfDF8YWxsfDF8fHx8fHwyfHwxNzEyNjUwODA5fA&ixlib=rb-4.0.3&q=80&w=1080');

  testGoldens('photo detail screen golden test', (tester) async {
    mockNetworkImagesFor(() async {
      final prefs = await SharedPreferences.getInstance();
      await tester.pumpWidget(MaterialApp(
          home: PhotoDetailScreen(
              wmFactory: (_) => PhotoDetailWM(PhotoDetailModel(
                  photoEntity: photoEntity,
                  repository: LocalPhotoRepository(PhotoStorage(prefs)))))));
      await expectLater(find.byType(Scaffold),
          matchesGoldenFile('goldens/photo_detail_golden.png'));
    });
  });
}
