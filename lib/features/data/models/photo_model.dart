import 'package:photostock/features/domain/entities/photo_entity.dart';

class PhotoModel extends PhotoEntity {
  const PhotoModel({
    String? id,
    String? slug,
    String? username,
    String? color,
    int? likes,
    String? createdAt,
    String? updatedAt,
    int? width,
    int? height,
    String? blurHash,
    String? description,
    String? imageUri,
  }) : super(
            id: id,
            slug: slug,
            username: username,
            color: color,
            likes: likes,
            createdAt: createdAt,
            updatedAt: updatedAt,
            width: width,
            height: height,
            blurHash: blurHash,
            description: description,
            imageUri: imageUri);

  factory PhotoModel.fromJson(Map<String, dynamic> map) => PhotoModel(
      id: map['id'],
      slug: map['slug'],
      username: (map['user'] as Map<String, dynamic>)['username'],
      color: map['color'],
      likes: map['likes'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      width: map['width'],
      height: map['height'],
      blurHash: map['blur_hash'],
      description: map['description'],
      imageUri: (map['urls'] as Map<String, dynamic>)['regular']);
}
