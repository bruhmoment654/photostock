import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:photostock/features/domain/entities/photo_entity.dart';

class PhotoDetailScreen extends StatelessWidget {
  final PhotoEntity photoEntity;

  const PhotoDetailScreen({super.key, required this.photoEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        '< Back',
                        overflow: TextOverflow.visible,
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      )),
                )
              ],
            ),
            expandedHeight: 370,
            flexibleSpace: FlexibleSpaceBar(
                background: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              child: CachedNetworkImage(
                imageUrl: photoEntity.imageUri ?? '',
                fit: BoxFit.cover,
                placeholder: (_, __) {
                  return BlurHash(hash: photoEntity.blurHash
                      ?? 'LCA^B_4:0K~XIToft8M_00-U=_IV');
                },
                errorWidget: (_, __, ___){
                  return const BlurHash(hash: 'LCA^B_4:0K~XIToft8M_00-U=_IV');
                },
              ),
            )),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  photoEntity.username ?? 'unknown user',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${photoEntity.likes} likes',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
