import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/core/services/services_locator.dart';
import 'package:wallpaper_app/core/widgets/empty_widget.dart';
import 'package:wallpaper_app/core/widgets/loading_widget.dart';
import 'package:wallpaper_app/feature/search/presentation/screens/widgets/search_app_bar.dart';

import '../../../../core/widgets/grid_view_widget.dart';
import '../controller/search_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<SearchBloc>(),
      child: BlocListener<SearchBloc, SearchState>(
        listener: (context, state) {
          if (state is SearchPhotoFail) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.failure.message ?? "")));
          }
        },
        child: Scaffold(
          appBar: SearchAppBar(),
          body: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              /// success
              if (state is SearchPhotoSuccess) {
                return GridViewWidget(
                  scrollController: context.read<SearchBloc>().scrollController,
                  photoList: state.photosList,
                );
              }
              /// loading
              else if (state is SearchPhotoLoading) {
                return const LoadingWidget();
              } else {
                return const EmptyWidget();
              }
            },
          ),
        ),
      ),
    );
  }
}
