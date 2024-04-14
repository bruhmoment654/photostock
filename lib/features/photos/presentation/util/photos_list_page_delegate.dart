import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:photostock/l10n/app_localizations_x.dart';

class PhotosListPageDelegate extends SliverPersistentHeaderDelegate {
  PhotosListPageDelegate({required this.maxExtent, required this.minExtent});

  @override
  final double minExtent;
  @override
  final double maxExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final colorScheme = Theme.of(context).colorScheme;
    final shrinkProportion = getShrinkPercent(shrinkOffset);
    var textPos = shrinkProportion * MediaQuery.of(context).size.width / 2 - 55;
    if (textPos < 0) {
      textPos = 0;
    }
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: shrinkProportion * 20),
            child: Container(
              color: colorScheme.surface.withOpacity(.75),
            ),
          ),
        ),
        Positioned(
          left: 15 + textPos,
          right: 0,
          bottom: 5,
          child: Text(
            context.l10n.photosAppSliverTemplate,
            style: TextStyle(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w700,
                fontSize: 25),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  double getShrinkPercent(double shrinkOffset) {
    return shrinkOffset / maxExtent;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
