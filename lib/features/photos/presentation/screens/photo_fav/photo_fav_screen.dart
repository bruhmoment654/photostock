import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/photos/presentation/screens/photo_fav/photo_fav_wm.dart';

import '../../../domain/entities/photo_entity.dart';
import '../../util/photos_list_page_delegate.dart';
import '../photo_list/widgets/loadable_photo_list_sliver.dart';

class PhotoFavScreen extends ElementaryWidget<IPhotoFavWM> {
  const PhotoFavScreen(
      {super.key, WidgetModelFactory wmFactory = defaultPhotoFavWM})
      : super(wmFactory);

  @override
  Widget build(IPhotoFavWM wm) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: PhotosListPageDelegate(
                minExtent: 90,
                maxExtent: 130,),
          ),
          ValueListenableBuilder(
              valueListenable: wm.state,
              builder: (BuildContext context, List<PhotoEntity> value,
                  Widget? child) {
                return LoadablePhotoListSliver(
                  photos: value,
                  onTap: (photo) => wm.onTileTap(photo),
                );
              }),
        ],
      ),
    );
  }
}
