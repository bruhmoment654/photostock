// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:photostock/api/app_dio_configurator.dart';
import 'package:photostock/api/service/photo_api_service.dart';
import 'package:photostock/config/app_config.dart';
import 'package:photostock/config/environment/build_type.dart';
import 'package:photostock/config/environment/environment.dart';
import 'package:photostock/core/constants/constants.dart';
import 'package:photostock/features/photo_list_feature/data/repository/photo_repository.dart';
import 'package:photostock/features/photo_list_feature/domain/repository/photo_repository.dart';
import 'package:test/test.dart';

void main() async {
  group('api tests:', () {
    final appConfig = AppConfig(
        url: const Environment(buildType: BuildType.dev).buildType.defaultUrl);

    final dio = const AppDioConfigurator().create(
      interceptors: [],
      url: appConfig.url.value,
      proxyUrl: appConfig.proxyUrl,
    );
    final photosApiService = PhotoApi(dio);
    IPhotoRepository photoRepository = PhotoRepositoryImpl(photosApiService);


    test('clientId not null', () async {
      final result =
          await photoRepository.getPhotos(clientId: defaultClientId, page: 1);
      expect(result.response.statusCode == HttpStatus.ok, true);
    });

    test('clientId is null', () async {
      try {
        await photoRepository.getPhotos();
      } catch (e) {
        expect(e is DioException, true);
      }
    });
    test('page is null', () async {
      final result = await photoRepository.getPhotos(clientId: defaultClientId);
      expect(result.response.statusCode == HttpStatus.ok, true);
    });
    test('custom dio', () async {



    });
  });
}
