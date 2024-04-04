import 'package:flutter/gestures.dart';
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
  @override
  void initState() {
    BlocProvider.of<RemotePhotoBloc>(context)
        .add(const GetPhotos(clientId: defaultClientId));
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
                  return SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20),
                    delegate: SliverChildBuilderDelegate(
                        childCount: state.photos?.length, (context, index) {
                      return GestureDetector(
                        onTap: () => {
                          context.pushNamed('photo',
                              extra: state.photos?[index])
                        },
                        child: PhotoTile(
                          photoEntity: state.photos![index],
                        ),
                      );
                    }),
                  );
                }
                return SliverToBoxAdapter(
                  child: Container(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
