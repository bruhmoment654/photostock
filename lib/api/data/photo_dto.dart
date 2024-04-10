import 'package:json_annotation/json_annotation.dart';

part 'photo_dto.g.dart';

@JsonSerializable()
class PhotoDto {
  final String id;
  final String slug;
  final String username;
  final String color;
  final int likes;
  final String createdAt;
  final String updatedAt;
  final int width;
  final int height;
  final String blurHash;
  final String description;
  final String imageUri;

  const PhotoDto(
      {required this.id,
      required this.slug,
      required this.username,
      required this.color,
      required this.likes,
      required this.createdAt,
      required this.updatedAt,
      required this.width,
      required this.height,
      required this.blurHash,
      required this.description,
      required this.imageUri});

  factory PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoDtoToJson(this);
}
