import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:photostock/features/presentation/bloc/remote_photo_bloc.dart';
import 'package:photostock/features/presentation/util/photos_list_page_delegate.dart';
import 'package:photostock/features/presentation/widgets/photo_tile_widget.dart';
import 'package:sliver_tools/sliver_tools.dart';

class PhotosListScreen extends StatefulWidget {
  const PhotosListScreen({super.key});

  @override
  State<PhotosListScreen> createState() => _PhotosListScreenState();
}

class _PhotosListScreenState extends State<PhotosListScreen> {
  late final ScrollController _controller;

  void _handleScrollChange() {
    if (_controller.position.extentAfter <= 10) {
      BlocProvider.of<RemotePhotoBloc>(context).add(const GetPhotos());
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
    BlocProvider.of<RemotePhotoBloc>(context).add(const GetPhotos());
    _controller = ScrollController(
        onAttach: _handlePositionAttach, onDetach: _handlePositionDetach);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverPersistentHeader(
              pinned: true,
              delegate: PhotosListPageDelegate(minExtent: 90, maxExtent: 130)),
          BlocConsumer<RemotePhotoBloc, RemotePhotoState>(
            listener: (context, state) {
              if (state is RemotePhotoError) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Error while loading data')));
              }
            },
            builder: (_, state) {
              if (state is RemotePhotoLoading && state.photos.isEmpty) {
                return const SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 250),
                  sliver: SliverToBoxAdapter(
                      child: Center(
                          child: CupertinoActivityIndicator(
                    radius: 30,
                  ))),
                );
              }

              //onSuccess state doesn't need handling
              if (state.photos.isNotEmpty) {
                return MultiSliver(children: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 27),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20),
                      delegate: SliverChildBuilderDelegate(
                          childCount: state.photos.length, (context, index) {
                        return GestureDetector(
                          onTap: () => {
                            context.pushNamed('photo',
                                extra: state.photos[index])
                          },
                          child: PhotoTile(
                            photoEntity: state.photos[index],
                          ),
                        );
                      }),
                    ),
                  ),
                  (state is RemotePhotoLoading)
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

              //if no data or loading state
              return SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 200),
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
                            onPressed: () {
                              BlocProvider.of<RemotePhotoBloc>(context)
                                  .add(const GetPhotos());
                            },
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
}
