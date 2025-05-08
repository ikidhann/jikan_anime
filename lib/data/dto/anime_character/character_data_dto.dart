import 'dart:convert';

import 'package:jikan_anime/domain/entity/anime_character/character_data.dart';

import 'images_dto.dart';

class CharacterDataDto extends CharacterData {
  CharacterDataDto({super.malId, super.url, super.images, super.name});

  // JSON
  factory CharacterDataDto.fromRawJson(String str) =>
  CharacterDataDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // Maps
  factory CharacterDataDto.fromMap(Map<String, dynamic> json) =>
  CharacterDataDto(
    malId: json['mal_id'],
    url: json['url'],
    images: json['images'] == null ? null : ImagesDto.fromMap(json['images']),
    name: json['name'],
  );

  Map<String, dynamic> toMap() => {
    'mal_id': malId,
    'url': url,
    'images': images == null ? null : ImagesDto.fromImages(images!).toMap(),
    'name': name,
  };

  // Domain
  static CharacterDataDto fromCharacterData(CharacterData characterData) {
    return CharacterDataDto(
      malId: characterData.malId,
      url: characterData.url,
      images: characterData.images,
      name: characterData.name,
    );
  }

  CharacterData toCharacterData() {
    return CharacterData(malId: malId, url: url, images: images, name: name);
  }
}
