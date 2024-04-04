part of 'remote_photo_bloc.dart';

@immutable
sealed class RemotePhotoState extends Equatable {
  final List<PhotoEntity>? photos;

  const RemotePhotoState({this.photos});
}

class RemotePhotoLoading extends RemotePhotoState {
  const RemotePhotoLoading();

  @override
  List<Object?> get props => [];
}

class RemotePhotoSuccess extends RemotePhotoState {
  final int page;
  final String clientId;

  const RemotePhotoSuccess(
    List<PhotoEntity> photos,
    this.clientId,
    this.page,
  ) : super(photos: photos);

  @override
  List<Object?> get props => [photos];
}

class RemotePhotoError extends RemotePhotoState {
  final DioException exception;

  const RemotePhotoError(this.exception) : super();

  @override
  List<Object?> get props => [exception];
}
