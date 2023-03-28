part of 'favourite_bloc.dart';

abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteFailure extends FavouriteState {
  Failure failure;

  FavouriteFailure(this.failure);
}

class FavouriteSuccess extends FavouriteState {
  List<PhotoEntity> photosList;

  FavouriteSuccess(this.photosList);
}
