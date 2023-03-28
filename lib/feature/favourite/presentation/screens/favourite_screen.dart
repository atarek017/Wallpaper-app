import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/widgets/empty_widget.dart';
import '../../../../core/widgets/grid_view_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../controller/favourite_bloc.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<FavouriteBloc>()..add(GetFavPhoto()),
      child: BlocListener<FavouriteBloc, FavouriteState>(
        listener: (context, state) {

          ///fail
          if (state is FavouriteFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.failure.message ?? "")));
          }
        },
        child: Scaffold(
          body: BlocBuilder<FavouriteBloc, FavouriteState>(
            builder: (context, state) {
              /// success
              if (state is FavouriteSuccess) {
                return GridViewWidget(
                  scrollController: ScrollController(),
                  photoList: state.photosList,
                );
              }

              /// loading
              else if (state is FavouriteLoading) {
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
