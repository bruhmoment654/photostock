import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

import '../../../core/constants/constants.dart';
import '../../photo_list_feature/domain/entities/photo_entity.dart';

class PhotoDetailScreen extends StatelessWidget {

  final PhotoEntity photoEntity;

  const PhotoDetailScreen({super.key, required this.photoEntity});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
                      onPressed: context.router.back,
                      child: Text(
                        '< Back',
                        overflow: TextOverflow.visible,
                        style: textTheme.titleLarge,
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
                    imageUrl: photoEntity.imageUri,
                    fit: BoxFit.cover,
                    placeholder: (_, __) {
                      return BlurHash(hash: photoEntity.blurHash);
                    },
                    errorWidget: (_, __, ___) {
                      return const BlurHash(hash: defaultHash);
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
                    Text(photoEntity.username,
                        style: textTheme.headlineLarge?.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w700)),
                    Text('${photoEntity.likes} likes',
                        style: textTheme.labelLarge?.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w700)),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
