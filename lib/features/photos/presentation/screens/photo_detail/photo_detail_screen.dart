import 'package:cached_network_image/cached_network_image.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:photostock/features/photos/presentation/screens/photo_detail/photo_detail_wm.dart';

import '../../../../../core/constants/constants.dart';

class PhotoDetailScreen extends ElementaryWidget<IPhotoDetailWM> {
  const PhotoDetailScreen(
      {super.key, WidgetModelFactory wmFactory = defaultPhotoDetailWMFactory})
      : super(wmFactory);

  @override
  Widget build(IPhotoDetailWM wm) {
    final textTheme = wm.theme.textTheme;
    final colorScheme = wm.theme.colorScheme;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  child: TextButton(
                      onPressed: wm.onClickBack,
                      child: Text(
                        '< Back',
                        overflow: TextOverflow.visible,
                        style: textTheme.titleLarge,
                      )),
                ),
                AnimatedBuilder(
                    animation: wm.animation,
                    builder: (context, child) => IconButton(
                        color: wm.animation.value,
                        onPressed: wm.onClickLike,
                        icon: const Icon(Icons.favorite)))
              ],
            ),
            expandedHeight: 370,
            flexibleSpace: FlexibleSpaceBar(
                background: Hero(
              tag: wm.photoEntity.id,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                child: CachedNetworkImage(
                  imageUrl: wm.photoEntity.imageUri,
                  fit: BoxFit.cover,
                  placeholder: (_, __) {
                    return BlurHash(hash: wm.photoEntity.blurHash);
                  },
                  errorWidget: (_, __, ___) {
                    return const BlurHash(hash: defaultHash);
                  },
                ),
              ),
            )),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(wm.photoEntity.username,
                    style: textTheme.headlineLarge?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w700)),
                Text('${wm.photoEntity.likes} likes',
                    style: textTheme.labelLarge?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
