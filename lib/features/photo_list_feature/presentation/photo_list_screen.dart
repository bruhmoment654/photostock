import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/photo_list_feature/presentation/photo_list_wm.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:union_state/union_state.dart';

import '../domain/entities/photo_entity.dart';
import 'util/photos_list_page_delegate.dart';
import 'widgets/photo_tile_widget.dart';

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
              delegate: PhotosListPageDelegate(minExtent: 90, maxExtent: 130)),
          UnionStateListenableBuilder(
            unionStateListenable: wm.state,
            builder: (_, photos) {
              return _buildPhotoList(photos, wm);
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
                  : _buildPhotoList(photos, wm, showLoadingMarker: true);
            },
            failureBuilder: (_, __, photos) {
              //if no data or loading state
              return photos!.isNotEmpty
                  ? _buildPhotoList(photos, wm)
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
                                  icon: const Icon(Icons.refresh))
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

  Widget _buildPhotoList(List<PhotoEntity> photos, IPhotoListWM wm,
      {bool showLoadingMarker = false}) {
    return MultiSliver(children: <Widget>[
      SliverPadding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 27),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
          delegate: SliverChildBuilderDelegate(childCount: photos.length,
              (context, index) {
            return GestureDetector(
              onTap: () => wm.onTapCard(photos[index]),
              child: PhotoTile(
                photoEntity: photos[index],
              ),
            );
          }),
        ),
      ),
      (showLoadingMarker)
          ? const SliverPadding(
              padding: EdgeInsets.only(bottom: 30, top: 10),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
            )
          : const SizedBox()
    ]);
  }
}
