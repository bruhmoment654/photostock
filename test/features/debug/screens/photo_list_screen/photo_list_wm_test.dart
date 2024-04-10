import 'package:dio/dio.dart';
import 'package:elementary_test/elementary_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:photostock/core/constants/constants.dart';
import 'package:photostock/features/photo_list_feature/domain/entities/photo_entity.dart';
import 'package:photostock/features/photo_list_feature/domain/repository/photo_repository.dart';
import 'package:photostock/features/photo_list_feature/presentation/photo_list_model.dart';
import 'package:photostock/features/photo_list_feature/presentation/photo_list_screen.dart';
import 'package:photostock/features/photo_list_feature/presentation/photo_list_wm.dart';
import 'package:photostock/uikit/themes/app_theme_data.dart';
import 'package:retrofit/dio.dart';
import 'package:union_state/union_state.dart';

import '../../../../util/fake_path_provider.dart';

const second = Duration(seconds: 1);

class PhotoRepositoryMock extends Mock implements IPhotoRepository {}

class BuildContextMock extends Mock implements BuildContext {}

class PhotoListWMMock extends Mock implements IPhotoListWM {}

void main() {
  final photoRepo = PhotoRepositoryMock();

  PathProviderPlatform.instance = FakePathProviderPlatform();
  TestWidgetsFlutterBinding.ensureInitialized();

  const photoEntity = PhotoEntity(
      id: 'ID',
      username: 'TEST',
      likes: 999,
      blurHash: defaultHash,
      color: '#FFFFFFFF',
      imageUri:
          'https://images.unsplash.com/photo-1712334636720-ba4c9fd582bb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzMzE5MXwwfDF8YWxsfDF8fHx8fHwyfHwxNzEyNjUwODA5fA&ixlib=rb-4.0.3&q=80&w=1080');

  PhotoListWM setupWM() {
    return PhotoListWM(PhotoListModel(repository: photoRepo));
  }

  group('PhotoListWMTestGroup', () {
    testWidgetModel<PhotoListWM, PhotoListScreen>(
        'Successful enter and data load', setupWM, (wm, tester, context) async {
      //Request success
      when(() => photoRepo.getPhotos(
          clientId: any(named: 'clientId'),
          page: any(named: 'page'))).thenAnswer((invocation) async {
        return Future(() => HttpResponse([photoEntity],
            Response(requestOptions: RequestOptions(), statusCode: 200)));
      });

      tester.init();

      expect(wm.state.value is UnionStateLoading, true);
      expect(wm.state.value.data, []);

      await Future.delayed(second);

      expect(wm.state.value is UnionStateContent, true);
      expect(wm.state.value.data, [photoEntity]);
    });

    testWidgetModel<PhotoListWM, PhotoListScreen>(
        'Data error, then successful loading', setupWM,
        (wm, tester, context) async {
      //Request error
      when(() => photoRepo.getPhotos(
              clientId: any(named: 'clientId'), page: any(named: 'page')))
          .thenThrow(DioException(requestOptions: RequestOptions()));

      tester.init();
      expect(wm.state.value is UnionStateFailure, true);
      expect(wm.state.value.data, []);

      //Request success
      when(() => photoRepo.getPhotos(
          clientId: any(named: 'clientId'),
          page: any(named: 'page'))).thenAnswer((invocation) async {
        return Future(() => HttpResponse([photoEntity],
            Response(requestOptions: RequestOptions(), statusCode: 200)));
      });

      wm.getPhotos();
      expect(wm.state.value is UnionStateLoading, true);

      await Future.delayed(second);

      expect(wm.state.value is UnionStateContent, true);
      expect(wm.state.value.data, [photoEntity]);
    });

    testWidgetModel<PhotoListWM, PhotoListScreen>(
        'Successful data load, then error', setupWM,
        (wm, tester, context) async {
      //Request success
      when(() => photoRepo.getPhotos(
          clientId: any(named: 'clientId'),
          page: any(named: 'page'))).thenAnswer((invocation) async {
        return Future(() => HttpResponse([photoEntity],
            Response(requestOptions: RequestOptions(), statusCode: 200)));
      });

      tester.init();
      await Future.delayed(second);

      expect(wm.state.value is UnionStateContent, true);
      expect(wm.state.value.data, [photoEntity]);

      //Request error
      when(() => photoRepo.getPhotos(
              clientId: any(named: 'clientId'), page: any(named: 'page')))
          .thenThrow(DioException(requestOptions: RequestOptions()));

      wm.getPhotos();
      expect(wm.state.value is UnionStateFailure, true);
      expect(wm.state.value.data, [photoEntity]);
    });

    final wm = PhotoListWMMock();
    const photoListScreen = PhotoListScreen();

    setUp(() {
      when(() => wm.theme).thenReturn(AppThemeData.lightTheme);
      when(() => wm.state)
          .thenReturn(UnionStateNotifier.loading([photoEntity]));
      when(() => wm.controller).thenReturn(ScrollController());
    });

    testGoldens('Successful data load, golden', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidgetBuilder(photoListScreen.build(wm));
        await expectLater(find.byType(Scaffold),
            matchesGoldenFile('goldens/photo_list_golden.png'));
      });
    });
  });
}
