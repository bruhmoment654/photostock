class PhotoEntity {
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

  const PhotoEntity({this.id = '',
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

  factory PhotoEntity.fromJson(Map<String, dynamic> map) =>
      PhotoEntity(
          id: map['id'] ?? '',
          slug: map['slug'] ?? '',
          username: map['username'] ?? '',
          color: map['color'] ?? '',
          likes: map['likes']?? '',
          createdAt: map['createdAt'] ?? '',
          updatedAt: map['updatedAt'] ?? '',
          width: map['width'] ?? 0,
          height: map['height'] ?? 0,
          blurHash: map['blur_hash'] ?? '',
          description: map['description'] ?? '',
          rawImageUri: (map['urls'] as Map<String, dynamic>)['regular'] ?? '');
}
