// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoDto _$PhotoDtoFromJson(Map<String, dynamic> json) => PhotoDto(
      id: json['id'] as String,
      slug: json['slug'] as String,
      username: json['username'] as String,
      color: json['color'] as String,
      likes: json['likes'] as int,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      blurHash: json['blurHash'] as String,
      description: json['description'] as String,
      imageUri: json['imageUri'] as String,
    );

Map<String, dynamic> _$PhotoDtoToJson(PhotoDto instance) => <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'username': instance.username,
      'color': instance.color,
      'likes': instance.likes,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'width': instance.width,
      'height': instance.height,
      'blurHash': instance.blurHash,
      'description': instance.description,
      'imageUri': instance.imageUri,
    };
