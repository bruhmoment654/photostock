// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:dio/dio.dart';
import 'package:test/test.dart';
import 'package:photostock/core/constants/constants.dart';
import 'package:photostock/core/resources/data_state.dart';
import 'package:photostock/features/data/data_sources/remote/photo_api_service.dart';
import 'package:photostock/features/data/repository/photo_repository.dart';
import 'package:photostock/features/domain/repository/photo_repository.dart';
import 'package:photostock/features/domain/usecases/get_photos_remote_usecase.dart';

void main() async {
  group('api tests:', () {
    final dio = Dio();
    final photosApiService = PhotoApiService(dio);
    PhotoRepository photoRepository = PhotoRepositoryImpl(photosApiService);
    final getPhotosUseCase = GetPhotosRemoteUseCase(photoRepository);

    test('clientId not null', () async {
      final result = await getPhotosUseCase(params: (clientId, 1));
      expect(result is DataSuccess, true);
    });

    test('clientId is null', () async {
      final result = await getPhotosUseCase(params: (null, 1));
      expect(result is DataFailed, true);
    });

    test('page is null', () async {
      final result = await getPhotosUseCase(params: (clientId, null));
      expect(result is DataSuccess, true);
    });
  });
}
