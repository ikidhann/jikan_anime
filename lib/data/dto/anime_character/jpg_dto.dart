import 'dart:convert';

import 'package:jikan_anime/domain/entity/anime_character/jpg.dart';

class JpgDto extends Jpg {
  JpgDto({
    super.imageUrl,
});

  // Json
  factory JpgDto.fromRawJson(String str) =>
  JpgDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // Maps
  factory JpgDto.fromMap(Map<String, dynamic> json) =>
  JpgDto(
    imageUrl: json['image_url']
  );

  Map<String, dynamic> toMap() => {
    'image_url' : imageUrl
  };

  // Domain
  static JpgDto fromJpg(Jpg jpg) {
    return JpgDto(
      imageUrl: jpg.imageUrl
    );
  }

  Jpg toJpg() {
    return Jpg(
      imageUrl: imageUrl
    );
  }
}