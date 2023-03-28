import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/core/resources/routes.dart';
import 'package:wallpaper_app/core/services/services_locator.dart';
import 'package:wallpaper_app/core/widgets/empty_widget.dart';

import '../../../../core/widgets/grid_view_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../controller/photo/photo_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<PhotoBloc>()..add(GetPhoto()),
      child: BlocListener<PhotoBloc, PhotoState>(
        listener: (context, state) {
          if (state is PhotoFail) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.failure.message ?? "")));
          }
        },
        child: Scaffold(
          body: BlocBuilder<PhotoBloc, PhotoState>(
            builder: (context, state) {
              /// success
              if (state is PhotoSuccess) {
                return GridViewWidget(
                  scrollController: context.read<PhotoBloc>().scrollController,
                  photoList: state.photosList,
                );
              }

              /// loading
              else if (state is PhotoLoading) {
                return const LoadingWidget();
              }

              /// empty
              else {
                return const EmptyWidget();
              }
            },
          ),
        ),
      ),
    );
  }
}
