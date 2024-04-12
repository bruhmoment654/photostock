import 'package:flutter/cupertino.dart';
import 'package:photostock/features/photos/presentation/screens/photo_list/widgets/photo_tile_widget.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../domain/entities/photo_entity.dart';

class LoadablePhotoListSliver extends StatelessWidget {
  final List<PhotoEntity> photos;
  final void Function(PhotoEntity entity) onTap;
  final bool showLoadingMarker;

  const LoadablePhotoListSliver({
    super.key,
    required this.photos,
    required this.onTap,
    this.showLoadingMarker = false,
  });

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 27),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Hero(
                  tag: photos[index].id,
                  child: GestureDetector(
                    onTap: () => onTap(photos[index]),
                    child: PhotoTile(
                      photoEntity: photos[index],
                    ),
                  ),
                );
              },
              childCount: photos.length,
            ),
          ),
        ),
        if (showLoadingMarker)
          const SliverPadding(
            padding: EdgeInsets.only(bottom: 30, top: 10),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            ),
          ),
      ],
    );
  }
}
