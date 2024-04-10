import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/photos/presentation/screens/photo_list/photo_list_wm.dart';
import 'package:photostock/features/photos/presentation/screens/photo_list/widgets/loadable_photo_list_sliver.dart';

import 'package:union_state/union_state.dart';

import '../../util/photos_list_page_delegate.dart';



class PhotoListScreen extends ElementaryWidget<IPhotoListWM> {
  const PhotoListScreen(
      {WidgetModelFactory wmFactory = defaultPhotoWMFactory, super.key})
      : super(wmFactory);

  @override
  Widget build(IPhotoListWM wm) {
    final textTheme = wm.theme.textTheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        controller: wm.controller,
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: PhotosListPageDelegate(minExtent: 90, maxExtent: 130),
          ),
          UnionStateListenableBuilder(
            unionStateListenable: wm.state,
            builder: (_, photos) {
              return LoadablePhotoListSliver(
                photos: photos,
                onTap: (photo) => wm.onTileTap(photo),
              );
            },
            loadingBuilder: (_, photos) {
              return photos!.isEmpty
                  ? const SliverPadding(
                      padding: EdgeInsets.symmetric(vertical: 250),
                      sliver: SliverToBoxAdapter(
                          child: Center(
                              child: CupertinoActivityIndicator(
                        radius: 30,
                      ))),
                    )
                  : LoadablePhotoListSliver(
                      photos: photos,
                      onTap: (photo) => wm.onTileTap(photo),
                      showLoadingMarker: true,
                    );
            },
            failureBuilder: (_, __, photos) {
              //if no data or loading state
              return photos!.isNotEmpty
                  ? LoadablePhotoListSliver(
                      photos: photos,
                      onTap: (photo) => wm.onTileTap(photo),
                    )
                  : SliverPadding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 200),
                      sliver: SliverToBoxAdapter(
                        child: Center(
                          child: Column(
                            children: [
                              const Icon(
                                Icons.error,
                                size: 100,
                                color: Colors.red,
                              ),
                              Text(
                                'Error while getting data, check your internet connection.',
                                textAlign: TextAlign.center,
                                style: textTheme.titleMedium
                                    ?.copyWith(color: Colors.red),
                              ),
                              IconButton(
                                onPressed: () => wm.getPhotos(),
                                icon: const Icon(Icons.refresh),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
