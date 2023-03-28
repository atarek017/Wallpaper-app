part of 'full_image_bloc.dart';

abstract class FullImageEvent {}

class DownloadImage extends FullImageEvent {
  String imageUrl;

  DownloadImage(this.imageUrl);
}

class AddImageToFavourite extends FullImageEvent {
  PhotoEntity photoEntity;

  AddImageToFavourite(this.photoEntity);
}

class SetImageWallPaper extends FullImageEvent {
  String imageUrl;

  SetImageWallPaper(this.imageUrl);
}
