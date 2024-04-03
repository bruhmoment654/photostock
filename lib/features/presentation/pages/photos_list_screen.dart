import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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

  @override
  void initState() {
    page = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              pinned: true,
              delegate: PhotosListPageDelegate(minExtent: 90, maxExtent: 130)),
          SliverPadding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            sliver: BlocBuilder<RemotePhotoBloc, RemotePhotoState>(
              builder: (_, state) {
                if (state is RemotePhotoLoading) {
                  return const SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()));
                }
                if (state is RemotePhotoError) {}
                if (state is RemotePhotoSuccess) {
                  if (photos.length < 5) {
                    photos.addAll(state.photos!);
                  }
                }
                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20),
                  delegate: SliverChildBuilderDelegate(
                      childCount: photos.length, (context, index) {
                    return GestureDetector(
                      onTap: () => {context.pushNamed('photo', extra: photos[index])},
                      child: PhotoTile(
                        photoEntity: photos[index],
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
