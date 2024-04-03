import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:photostock/core/constants/constants.dart';
import 'package:photostock/features/presentation/bloc/remote_photo_bloc.dart';
import 'package:photostock/features/presentation/util/photos_list_page_delegate.dart';
import 'package:photostock/features/presentation/widgets/photo_tile_widget.dart';

import '../../domain/entities/photo_entity.dart';

class PhotosListScreen extends StatefulWidget {
  const PhotosListScreen({super.key});

  @override
  State<PhotosListScreen> createState() => _PhotosListScreenState();
}

class _PhotosListScreenState extends State<PhotosListScreen> {
  late int page;
  List<PhotoEntity> photos = [];
  late final ScrollController _controller;
  late bool _isLoading;

  void _handleScrollChange() {
    if (_controller.position.extentAfter <= 25) {
      setState(() {
        page += 1;
        _isLoading = true;
        BlocProvider.of<RemotePhotoBloc>(context)
            .add(GetPhotos((clientId, page)));
      });
    }
  }

  void _handlePositionAttach(ScrollPosition position) {
    position.isScrollingNotifier.addListener(_handleScrollChange);
  }

  void _handlePositionDetach(ScrollPosition position) {
    position.isScrollingNotifier.removeListener(_handleScrollChange);
  }

  @override
  void initState() {
    _isLoading = false;
    _controller = ScrollController(
        onAttach: _handlePositionAttach, onDetach: _handlePositionDetach);
    page = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverPersistentHeader(
              pinned: true,
              delegate: PhotosListPageDelegate(minExtent: 90, maxExtent: 130)),
          SliverPadding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 30),
            sliver: BlocBuilder<RemotePhotoBloc, RemotePhotoState>(
              builder: (_, state) {
                if (state is RemotePhotoLoading) {
                  return const SliverPadding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 200),
                      sliver: SliverToBoxAdapter(
                          child: Center(child: CircularProgressIndicator())));
                }
                if (state is RemotePhotoError) {
                  return SliverPadding(
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
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.red),
                          )
                        ],
                      ))));
                }
                if (state is RemotePhotoSuccess) {
                  photos.addAll(state.photos!);
                }
                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20),
                  delegate: SliverChildBuilderDelegate(
                      childCount: photos.length, (context, index) {
                    return GestureDetector(
                      onTap: () =>
                          {context.pushNamed('photo', extra: photos[index])},
                      child: PhotoTile(
                        photoEntity: photos[index],
                      ),
                    );
                  }),
                );
              },
            ),
          ),
          _isLoading
              ? const SliverPadding(
                  padding: EdgeInsets.only(bottom: 50),
                  sliver: SliverToBoxAdapter(
                    child: CupertinoActivityIndicator(),
                  ),
                )
              : const SliverToBoxAdapter()
        ],
      ),
    );
  }
}
