// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:photostock/core/constants/constants.dart';
import 'package:photostock/features/data/data_sources/remote/photo_api_service.dart';
import 'package:photostock/features/data/repository/photo_repository.dart';
import 'package:photostock/features/domain/repository/photo_repository.dart';
import 'package:test/test.dart';

void main() async {
  group('api tests:', () {
    final dio = Dio();
    final photosApiService = PhotoApiService(dio);
    PhotoRepository photoRepository = PhotoRepositoryImpl(photosApiService);

    test('clientId not null', () async {
      final result =
          await photoRepository.getPhotos(clientId: clientId, page: 1);
      expect(result.response.statusCode == HttpStatus.ok, true);
    });

    test('clientId is null', () async {
      try {
        photoRepository.getPhotos();
      } catch (e) {
        expect(e is DioException, true);
      }
    });

    test('page is null', () async {
      final result = await photoRepository.getPhotos(clientId: clientId);
      expect(result.response.statusCode == HttpStatus.ok, true);
    });
  });
}
