import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/photos/presentation/screens/photo_list/photo_list_wm.dart';
import 'package:photostock/features/photos/presentation/screens/photo_list/widgets/error_message_widget.dart';
import 'package:photostock/features/photos/presentation/screens/photo_list/widgets/loadable_photo_list_sliver.dart';
import 'package:union_state/union_state.dart';

import '../../util/photos_list_page_delegate.dart';

class PhotoListScreen extends ElementaryWidget<IPhotoListWM> {
  const PhotoListScreen(
      {WidgetModelFactory wmFactory = defaultPhotoWMFactory, super.key})
      : super(wmFactory);

  @override
  Widget build(IPhotoListWM wm) {
    final width = wm.width;

    return Scaffold(
      backgroundColor: wm.theme.colorScheme.surface,
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        controller: wm.controller,
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: PhotosListPageDelegate(
              minExtent: 90,
              maxExtent: 130,
            ),
          ),
          AnimatedBuilder(
            animation: wm.animationController,
            builder: (_, __) => ValueListenableBuilder(
              valueListenable: wm.state,
              builder: (_, state, __) {
                final photos = state.data!;
                //On content
                if (state is UnionStateContent) {
                  return LoadablePhotoListSliver(
                    photos: photos,
                    onTap: (photo) => wm.onTileTap(photo),
                  );
                }

                if (photos.isEmpty) {
                  if (state is UnionStateLoading ||
                      state is UnionStateFailure) {
                    return SliverPadding(
                      padding: const EdgeInsets.symmetric(vertical: 250),
                      sliver: SliverToBoxAdapter(
                          child: SizedBox(
                        width: 300,
                        height: 300,
                        child: Stack(children: [
                          Positioned(
                            top: 20,
                            left: width / 2 -
                                30, // half screen - indicator radius
                            child: Opacity(
                              opacity: wm.loadingAnimation.value,
                              child: const Center(
                                  child: CupertinoActivityIndicator(
                                radius: 30,
                              )),
                            ),
                          ),
                          if (state is UnionStateFailure)
                            Opacity(
                              opacity: wm.errorAnimation.value,
                              child: ErrorMessageWidget(
                                refreshCallback: wm.refresh,
                              ),
                            ),
                        ]),
                      )),
                    );
                  }
                } else {
                  return LoadablePhotoListSliver(
                      photos: photos,
                      onTap: (photo) => wm.onTileTap(photo),
                      showLoadingMarker: true);
                }

                if (state is UnionStateFailure && photos.isNotEmpty) {
                  return LoadablePhotoListSliver(
                    photos: photos,
                    onTap: (photo) => wm.onTileTap(photo),
                  );
                }
                return const SizedBox();
              },
            ),
          )
        ],
      ),
    );
  }
}
