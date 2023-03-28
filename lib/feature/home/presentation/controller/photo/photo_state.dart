part of 'photo_bloc.dart';

abstract class PhotoState {}

class PhotoInitial extends PhotoState {}

class PhotoLoading extends PhotoState {}

class PhotoLoadingMore extends PhotoState {}

class PhotoFail extends PhotoState {
  Failure failure;

  PhotoFail(this.failure);
}

class PhotoSuccess extends PhotoState {
  List<PhotoEntity> photosList;

  PhotoSuccess({
    required this.photosList,
  });
}
