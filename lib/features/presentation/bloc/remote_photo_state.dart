part of 'remote_photo_bloc.dart';

@immutable
sealed class RemotePhotoState extends Equatable {
  final List<PhotoEntity>? photos;
  final DioException? exception;

  const RemotePhotoState({this.photos, this.exception});

  @override
  List<Object?> get props => [photos, exception];
}

class RemotePhotoLoading extends RemotePhotoState {
  const RemotePhotoLoading();
}

class RemotePhotoSuccess extends RemotePhotoState {
  const RemotePhotoSuccess(List<PhotoEntity> photos) : super(photos: photos);
}

class RemotePhotoError extends RemotePhotoState {
  const RemotePhotoError(DioException exception) : super(exception: exception);
}
