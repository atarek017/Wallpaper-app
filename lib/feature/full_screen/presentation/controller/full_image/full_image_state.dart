part of 'full_image_bloc.dart';

abstract class FullImageState {}

class FullImageInitial extends FullImageState {}

class FullImageFail extends FullImageState {
  Failure failure;

  FullImageFail(this.failure);
}

class FullImageSuccess extends FullImageState {
  String message;

  FullImageSuccess({required this.message});
}
