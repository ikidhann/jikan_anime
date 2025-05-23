import 'package:flutter_test/flutter_test.dart';
import 'package:jikan_anime/data/dto/anime_character/images_dto.dart';
import 'package:jikan_anime/data/dto/anime_character/jpg_dto.dart';

void main() {
  group("ImagesDto", () {
    late String referenceRawJson;
    late ImagesDto referenceDto;

    setUp(() {
      referenceDto = ImagesDto(
        jpg: JpgDto(
          imageUrl: "https://example.com/images/123"
        )
      );

      referenceRawJson = referenceDto.toRawJson();
    });

    test("should create ImagesDTO to/from JSON", () {
      final createdDto = ImagesDto.fromRawJson(referenceRawJson);
      final json = createdDto.toRawJson();

      expect(createdDto, referenceDto);
      expect(json, referenceRawJson);
    });
  });
}