import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:photostock/features/data/data_sources/remote/photo_api_service.dart';
import 'package:photostock/features/data/repository/photo_repository.dart';
import 'package:photostock/features/domain/repository/photo_repository.dart';
import 'package:photostock/features/presentation/bloc/remote_photo_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<PhotoApiService>(PhotoApiService(sl()));
  sl.registerSingleton<PhotoRepository>(PhotoRepositoryImpl(sl()));
  sl.registerFactory<RemotePhotoBloc>(() => RemotePhotoBloc(sl()));
}
