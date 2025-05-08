import 'package:flutter_test/flutter_test.dart';
import 'package:jikan_anime/data/dto/anime_character/character_data_dto.dart';
import 'package:jikan_anime/data/dto/anime_character/images_dto.dart';
import 'package:jikan_anime/data/dto/anime_character/jpg_dto.dart';

void main() {
  group("CharacterDataDto", () {
    late String referenceRawJson;
    late CharacterDataDto referenceDto;

    setUp(() {
      referenceDto = CharacterDataDto(
        malId: 3,
        url: "https://myanimelist.net/character/3/Jet_Black",
        images: ImagesDto(
          jpg: JpgDto(
            imageUrl:
                "https://cdn.myanimelist.net/images/characters/11/253723.jpg?s=6c8a19a79a88c46ae15f30e3ef5fd839",
          ),
        ),
        name: "Black, Jet",
      );

      referenceRawJson = referenceDto.toRawJson();
    });

    test("should create CharacterDataDto instance to/from JSON", () {
      final createdDto = CharacterDataDto.fromRawJson(referenceRawJson);
      final json = createdDto.toRawJson();

      expect(createdDto, referenceDto);
      expect(json, referenceRawJson);
    });
  });
}
