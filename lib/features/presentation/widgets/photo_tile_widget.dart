import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:photostock/features/domain/entities/photo_entity.dart';

class PhotoTile extends StatelessWidget {
  final PhotoEntity photoEntity;

  const PhotoTile({super.key, required this.photoEntity});

  @override
  Widget build(BuildContext context) {
    String colorString = photoEntity.color ?? '#808080';
    Color color =
        Color(int.parse(colorString.substring(1, 7), radix: 16) + 0xFF000000);
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(25), boxShadow: [
        BoxShadow(
            color: color.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 8))
      ]),
      child: Stack(fit: StackFit.expand, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: CachedNetworkImage(
            imageUrl: photoEntity.imageUri ?? '',
            fit: BoxFit.cover,
            placeholder: (_, __) {
              return BlurHash(
                  hash: photoEntity.blurHash ?? 'LCA^B_4:0K~XIToft8M_00-U=_IV');
            },
            errorWidget: (_, __, ___) {
              return const BlurHash(hash: 'LCA^B_4:0K~XIToft8M_00-U=_IV');
            },
          ),
        ),
        Positioned(
          top: 127,
          left: 15,
            child: Text(
          photoEntity.username ?? 'unknown',
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            fontSize: 12
          ),
        )),
        Positioned(
            top: 152,
            left: 15,
            child: Text(
                '${photoEntity.likes} likes',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10
              ),
            )),
      ]),
    );
  }
}
