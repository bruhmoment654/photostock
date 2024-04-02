import 'package:photostock/core/resources/data_state.dart';
import 'package:photostock/core/usecase/use_case.dart';
import 'package:photostock/features/domain/entities/photo_entity.dart';
import 'package:photostock/features/domain/repository/photo_repository.dart';

class GetPhotosRemoteUseCase
    extends UseCase<DataState<List<PhotoEntity>>,(String?, int?)?> {
  final PhotoRepository _photoRepository;

  GetPhotosRemoteUseCase(this._photoRepository);

  @override
  Future<DataState<List<PhotoEntity>>> call({(String?, int?)? params}) {
    return _photoRepository.getPhotos(clientId: params?.$1, page: params?.$2);
  }
}
