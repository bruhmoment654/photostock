import 'package:photostock/features/domain/entities/photo_entity.dart';

import '../../../core/resources/data_state.dart';

abstract class PhotoRepository{

Future<DataState<List<PhotoEntity>>> getPhotos({String? clientId, int? page});
}