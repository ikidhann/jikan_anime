import 'dart:convert';

import 'package:jikan_anime/data/dto/anime_character/jpg_dto.dart';
import 'package:jikan_anime/domain/entity/anime_character/images.dart';

class ImagesDto extends Images {
  ImagesDto({super.jpg});

  // Json
  factory ImagesDto.fromRawJson(String str) =>
  ImagesDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // Maps
  factory ImagesDto.fromMap(Map<String, dynamic> json) =>
      ImagesDto(jpg: json['jpg'] == null ? null : JpgDto.fromMap(json['jpg']));

  Map<String, dynamic> toMap() => {'jpg': jpg == null ? null : JpgDto.fromJpg(jpg!).toMap()};

  // Domain
  static ImagesDto fromImages(Images images) {
    return ImagesDto(jpg: images.jpg);
  }

  Images toImages() {
    return Images(jpg: jpg);
  }
}
