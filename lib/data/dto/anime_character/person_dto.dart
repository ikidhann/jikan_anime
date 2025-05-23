import 'dart:convert';

import 'package:jikan_anime/domain/entity/anime_character/person.dart';

import 'images_dto.dart';

class PersonDto extends Person {
  PersonDto({super.malId, super.url, super.images, super.name});

  // JSON
  factory PersonDto.fromRawJson(String str) =>
  PersonDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // Maps
  factory PersonDto.fromMap(Map<String, dynamic> json) => PersonDto(
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
  static PersonDto fromPerson(Person person) {
    return PersonDto(
      malId: person.malId,
      url: person.url,
      images: person.images,
      name: person.name,
    );
  }

  Person toPerson() {
    return Person(malId: malId, url: url, images: images, name: name);
  }
}
