class PhotoResponseEntity {
  PhotoResponseEntity({
    required this.page,
    required this.perPage,
    required this.photos,
    required this.totalResults,
    required this.hasNextPage,
  });

  int page;
  int perPage;
  List<PhotoEntity> photos;
  int totalResults;
  bool hasNextPage;
}

class PhotoEntity {
  int id;
  int width;
  int height;
  String url;
  String photographer;
  String photographerUrl;
  int photographerId;
  String avgColor;

  String large2X;
  String tiny;
  bool liked;
  String alt;

  PhotoEntity(
      {required this.id,
      required this.width,
      required this.height,
      required this.url,
      required this.photographer,
      required this.photographerUrl,
      required this.photographerId,
      required this.avgColor,
      // required this.src,
      required this.tiny,
      required this.large2X,
      required this.liked,
      required this.alt});
}
