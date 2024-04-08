import 'package:cached_network_image/cached_network_image.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:go_router/go_router.dart';
import 'package:photostock/core/constants/constants.dart';
import 'package:photostock/features/photo_detail_feature/presentation/photo_detail_wm.dart';

import '../../photo_list_feature/domain/entities/photo_entity.dart';

class PhotoDetailScreen extends ElementaryWidget<IPhotoDetailWM> {
  final PhotoEntity photoEntity;

  const PhotoDetailScreen(
      {super.key,
      required this.photoEntity,
      WidgetModelFactory wmFactory = defaultPhotoDetailWMFactory})
      : super(wmFactory);

  @override
  Widget build(IPhotoDetailWM wm) {
    final textTheme = wm.theme.textTheme;
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
                      onPressed: () => wm.onBackBtnPressed(),
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
