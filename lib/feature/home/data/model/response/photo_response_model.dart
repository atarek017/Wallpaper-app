import 'package:wallpaper_app/core/utels/shared_func.dart';
import 'package:wallpaper_app/feature/home/domain/entity/response_entity/photo_response.dart';

class PhotoResponseModel extends PhotoResponseEntity {
  PhotoResponseModel({
    required super.page,
    required super.perPage,
    required super.photos,
    required super.totalResults,
    required super.hasNextPage,
  });

  factory PhotoResponseModel.fromJson(Map<String, dynamic> json) =>
      PhotoResponseModel(
        page: json["page"],
        perPage: json["per_page"],
        photos: List<PhotoEntity>.from(
            json["photos"].map((x) => PhotoModel.fromJson(x, true))),
        totalResults: json["total_results"],
        hasNextPage: json.containsKey("next_page"),
      );
}

class PhotoModel extends PhotoEntity {
  PhotoModel(
      {required super.id,
      required super.width,
      required super.height,
      required super.url,
      required super.photographer,
      required super.photographerUrl,
      required super.photographerId,
      required super.avgColor,
      // required super.src,

      required super.large2X,
      required super.tiny,
      required super.liked,
      required super.alt});

  factory PhotoModel.fromJson(Map<String, dynamic> json, bool isRemote) {
    return PhotoModel(
      id: json["id"],
      width: json["width"],
      height: json["height"],
      url: json["url"],
      photographer: json["photographer"],
      photographerUrl: json["photographer_url"],
      photographerId: json["photographer_id"],
      avgColor: json["avg_color"],
      large2X: isRemote ? json["src"]["large2x"] : json["large2x"],
      tiny: isRemote ? json["src"]["tiny"] : json['tiny'],
      liked: json["liked"].runtimeType == int
          ? AppUtils.intToBool(json["liked"])
          : json["liked"],
      alt: json["alt"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
        "photographer": photographer,
        "photographer_url": photographerUrl,
        "photographer_id": photographerId,
        "avg_color": avgColor,
        // "src": SrcModel.obj(src).toJson(),
        "large2X": large2X,
        "tiny": tiny,
        "liked": liked ? 1 : 0,
        "alt": alt,
      };

  factory PhotoModel.opj(PhotoEntity photoEntity) => PhotoModel(
        id: photoEntity.id,
        width: photoEntity.width,
        height: photoEntity.height,
        url: photoEntity.url,
        photographer: photoEntity.photographer,
        photographerUrl: photoEntity.photographerUrl,
        photographerId: photoEntity.photographerId,
        avgColor: photoEntity.avgColor,
        tiny: photoEntity.tiny,
        large2X: photoEntity.large2X,
        liked: photoEntity.liked,
        alt: photoEntity.alt,
      );
}
