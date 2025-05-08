import 'package:flutter_test/flutter_test.dart';
import 'package:jikan_anime/data/dto/anime_character/images_dto.dart';
import 'package:jikan_anime/data/dto/anime_character/jpg_dto.dart';
import 'package:jikan_anime/data/dto/anime_character/person_dto.dart';

void main() {
  group("PersonDto", () {
    late String referenceRawJson;
    late PersonDto referenceDto;

    setUp(() {
      referenceDto = PersonDto(
        malId: 1,
        url: "https://example.com/person/12",
        images: ImagesDto(
          jpg: JpgDto(
            imageUrl: "https://example.com/images/1"
          )
        ),
        name: "Person 1",
      );

      referenceRawJson = referenceDto.toRawJson();
    });

    test("create PersonDto to/from JSON", () {
      final createdDto = PersonDto.fromRawJson(referenceRawJson);
      final json = createdDto.toRawJson();

      expect(createdDto, referenceDto);
      expect(json, referenceRawJson);
    });
  });
}