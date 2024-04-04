part of 'remote_photo_bloc.dart';

sealed class RemotePhotoEvent {
  const RemotePhotoEvent();
}

class GetPhotos extends RemotePhotoEvent {
  final String clientId;
  final int? page;

  const GetPhotos({this.clientId = defaultClientId, this.page}) : super();
}
