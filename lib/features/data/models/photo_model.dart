import 'package:photostock/features/domain/entities/photo_entity.dart';

class PhotoModel extends PhotoEntity {
  const PhotoModel({
    String? id,
    String? slug,
    String? createdAt,
    String? updatedAt,
    int? width,
    int? height,
    String? blurHash,
    String? description,
    String? rawImageUri,
  }) : super(
            id: id,
            slug: slug,
            createdAt: createdAt,
            updatedAt: updatedAt,
            width: width,
            height: height,
            blurHash: blurHash,
            description: description,
            rawImageUri: rawImageUri);

  factory PhotoModel.fromJson(Map<String, dynamic> map) => PhotoModel(
      id: map['id'],
      slug: map['slug'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      width: map['width'],
      height: map['height'],
      blurHash: map['blurHash'],
      description: map['description'],
      rawImageUri: (map['urls'] as Map<String, dynamic>)['raw']);
}
