part of 'search_bloc.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class   SearchPhotoSuccess extends SearchState {
  List<PhotoEntity> photosList;

  SearchPhotoSuccess(this.photosList);
}

class SearchPhotoLoading extends SearchState {}

class SearchPhotoFail extends SearchState {
  Failure failure;

  SearchPhotoFail(this.failure);
}
