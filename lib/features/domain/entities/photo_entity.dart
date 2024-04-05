import 'package:equatable/equatable.dart';

class PhotoEntity extends Equatable {
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

  const PhotoEntity(
      {this.id = '',
      this.slug = '',
      this.username = '',
      this.color = '',
      this.likes = 0,
      this.createdAt = '',
      this.updatedAt = '',
      this.width = 0,
      this.height = 0,
      this.blurHash = '',
      this.description = '',
      this.imageUri = ''});

  @override
  String toString() {
    return 'PhotoEntity{id: $id, slug: $slug, createdAt: $createdAt, updatedAt: $updatedAt, width: $width, height: $height, blurHash: $blurHash, description: $description, rawImageUri: $imageUri}';
  }

  @override
  List<Object?> get props => [
        id,
        slug,
        username,
        color,
        createdAt,
        updatedAt,
        width,
        height,
        blurHash,
        description,
        imageUri
      ];

  factory PhotoEntity.fromJson(Map<String, dynamic> map) => PhotoEntity(
      id: map['id'] ?? '',
      slug: map['slug'] ?? '',
      username: (map['user'] as Map<String, dynamic>)['username'] ?? '',
      color: map['color'] ?? '',
      likes: map['likes'] ?? 0,
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      width: map['width'] ?? 0,
      height: map['height'] ?? 0,
      blurHash: map['blur_hash'] ?? '',
      description: map['description'] ?? '',
      imageUri: (map['urls'] as Map<String, dynamic>)['regular'] ?? '');
}
