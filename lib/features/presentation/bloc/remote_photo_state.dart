part of 'remote_photo_bloc.dart';

@immutable
sealed class RemotePhotoState extends Equatable {
  final List<PhotoEntity> photos;

  const RemotePhotoState({required this.photos});
}

class RemotePhotoLoading extends RemotePhotoState {
  const RemotePhotoLoading(List<PhotoEntity> photos) : super(photos: photos);

  @override
  List<Object?> get props => [photos];
}

class RemotePhotoSuccess extends RemotePhotoState {
  final int page;

  const RemotePhotoSuccess(List<PhotoEntity> photos, this.page)
      : super(photos: photos);

  @override
  List<Object?> get props => [photos, page];
}

class RemotePhotoError extends RemotePhotoState {
  final DioException exception;

  const RemotePhotoError(List<PhotoEntity> photos, this.exception)
      : super(photos: photos);

  @override
  List<Object?> get props => [photos, exception];
}
