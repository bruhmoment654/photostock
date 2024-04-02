part of 'remote_photo_bloc.dart';

sealed class RemotePhotoEvent {
  final (String?, int?) requestParams;
  const RemotePhotoEvent(this.requestParams);
}

class GetPhotos extends RemotePhotoEvent {
  const GetPhotos((String?, int?) requestParams) : super(requestParams);
}
