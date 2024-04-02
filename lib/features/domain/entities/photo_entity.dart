class PhotoEntity {
  final String? id;
  final String? slug;
  final String? username;
  final String? color;
  final int? likes;
  final String? createdAt;
  final String? updatedAt;
  final int? width;
  final int? height;
  final String? blurHash;
  final String? description;
  final String? imageUri;

  const PhotoEntity({this.id,
    this.slug,
    this.username,
    this.color,
    this.likes,
    this.createdAt,
    this.updatedAt,
    this.width,
    this.height,
    this.blurHash,
    this.description,
    this.imageUri});


  @override
  String toString() {
    return 'PhotoEntity{id: $id, slug: $slug, username: $username, color: $color, createdAt: $createdAt, updatedAt: $updatedAt, width: $width, height: $height, blurHash: $blurHash, description: $description, imageUri: $imageUri}';
  }
}
