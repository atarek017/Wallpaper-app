import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/core/resources/color_manger.dart';

import '../../../../core/services/services_locator.dart';
import '../../../home/domain/entity/response_entity/photo_response.dart';
import '../controller/full_image/full_image_bloc.dart';

class FullImageScreen extends StatelessWidget {
  final PhotoEntity photoEntity;

  const FullImageScreen({required this.photoEntity, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<FullImageBloc>(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<FullImageBloc, FullImageState>(
              listener: (context, state) {
            /// success
            if (state is FullImageSuccess) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }

            ///fail
            if (state is FullImageFail) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.failure.message ?? "")));
            }
          })
        ],
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                photoEntity.large2X,
                fit: BoxFit.fitHeight,
              ),
              BlocBuilder<FullImageBloc, FullImageState>(
                builder: (context, state) {
                  return Positioned(
                    right: 12.0,
                    bottom: 50.0,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        IconButton(
                            onPressed: () {
                              context
                                  .read<FullImageBloc>()
                                  .add(AddImageToFavourite(photoEntity));
                            },
                            icon: Icon(
                              photoEntity.liked
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              size: 35.0,
                              color: photoEntity.liked
                                  ? ColorManger.mainColor
                                  : Colors.white,
                            )),
                        const SizedBox(
                          height: 10.0,
                        ),
                        IconButton(
                            onPressed: () {
                              context
                                  .read<FullImageBloc>()
                                  .add(DownloadImage(photoEntity.large2X));
                            },
                            icon: const Icon(Icons.download,
                                size: 30.0, color: Colors.white)),
                        const SizedBox(
                          height: 10.0,
                        ),
                        IconButton(
                            onPressed: () {
                              context
                                  .read<FullImageBloc>()
                                  .add(SetImageWallPaper(photoEntity.large2X));
                            },
                            icon: const Icon(Icons.wallpaper,
                                size: 30.0, color: Colors.white))
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
