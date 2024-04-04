class PhotoEntity {
  final String id;
  final String slug;
  final String createdAt;
  final String updatedAt;
  final int width;
  final int height;
  final String blurHash;
  final String description;
  final String rawImageUri;

  const PhotoEntity(
      {this.id = '',
      this.slug = '',
      this.createdAt = '',
      this.updatedAt = '',
      this.width = 0,
      this.height = 0,
      this.blurHash = '',
      this.description = '',
      this.rawImageUri = ''});

  @override
  String toString() {
    return 'PhotoEntity{id: $id, slug: $slug, createdAt: $createdAt, updatedAt: $updatedAt, width: $width, height: $height, blurHash: $blurHash, description: $description, rawImageUri: $rawImageUri}';
  }

  factory PhotoEntity.fromJson(Map<String, dynamic> map) => PhotoEntity(
      id: map['id'] ?? '',
      slug: map['slug'] ?? '',
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      width: map['width'] ?? 0,
      height: map['height'] ?? 0,
      blurHash: map['blurHash'] ?? '',
      description: map['description'] ?? '',
      rawImageUri: (map['urls'] as Map<String, dynamic>)['raw'] ?? '');
}
