class PhotoEntity {
  final String? id;
  final String? slug;
  final String? createdAt;
  final String? updatedAt;
  final int? width;
  final int? height;
  final String? blurHash;
  final String? description;
  final String? rawImageUri;

  const PhotoEntity(
      {this.id,
      this.slug,
      this.createdAt,
      this.updatedAt,
      this.width,
      this.height,
      this.blurHash,
      this.description,
      this.rawImageUri});

  @override
  String toString() {
    return 'PhotoEntity{id: $id, slug: $slug, createdAt: $createdAt, updatedAt: $updatedAt, width: $width, height: $height, blurHash: $blurHash, description: $description, rawImageUri: $rawImageUri}';
  }
}
