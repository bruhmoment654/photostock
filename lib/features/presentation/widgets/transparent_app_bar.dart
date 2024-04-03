import 'dart:ui';

import 'package:flutter/material.dart';

class TransparentAppBar extends StatelessWidget {
  final String title;

  const TransparentAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      backgroundColor: Colors.transparent,
      pinned: true,
      floating: false,
      snap: false,
      flexibleSpace: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.all(8),
            title: Text(title),
          ),
        ),
      ),
    );
  }
}
