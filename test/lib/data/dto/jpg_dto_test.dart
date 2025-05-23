import 'package:flutter_test/flutter_test.dart';
import 'package:jikan_anime/data/dto/anime_character/jpg_dto.dart';

void main() {
  group("JpgDto", () {
    late String referenceRawJson;
    late JpgDto referenceDto;

    setUp(() {
      referenceDto = JpgDto(
        imageUrl: "https://example.com/images/123",
      );

      referenceRawJson = referenceDto.toRawJson();
    });

    test("should create JpgDto to/from JSON", () {
      final createdDto = JpgDto.fromRawJson(referenceRawJson);
      final json = createdDto.toRawJson();

      expect(createdDto, referenceDto);
      expect(json, referenceRawJson);
    });
  });
}