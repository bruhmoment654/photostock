part of 'remote_photo_bloc.dart';

sealed class RemotePhotoEvent {
  const RemotePhotoEvent();
}

class GetPhotos extends RemotePhotoEvent {
  const GetPhotos() : super();
}
