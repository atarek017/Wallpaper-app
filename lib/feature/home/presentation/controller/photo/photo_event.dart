part of 'photo_bloc.dart';

abstract class PhotoEvent {}

class GetPhoto extends PhotoEvent {}

class GetMorePhoto extends PhotoEvent {
  int page;

  GetMorePhoto(this.page);
}
