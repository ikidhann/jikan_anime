import 'package:flutter_test/flutter_test.dart';
import 'package:jikan_anime/data/dto/anime_character/character_data_dto.dart';
import 'package:jikan_anime/data/dto/anime_character/character_dto.dart';
import 'package:jikan_anime/data/dto/anime_character/images_dto.dart';
import 'package:jikan_anime/data/dto/anime_character/jpg_dto.dart';
import 'package:jikan_anime/data/dto/anime_character/person_dto.dart';
import 'package:jikan_anime/data/dto/anime_character/voice_actor_dto.dart';

void main() {
  group('CharacterDto', () {
    late String referenceRawJson;
    late CharacterDto referenceDto;

    setUp(() {
      referenceDto = CharacterDto(
          character: CharacterDataDto(
            malId: 3,
            url: "https://myanimelist.net/character/3/Jet_Black",
            images: ImagesDto(
                jpg: JpgDto(
                    imageUrl: "https://cdn.myanimelist.net/images/characters/11/253723.jpg?s=6c8a19a79a88c46ae15f30e3ef5fd839"
                )
            ),
            name: "Black, Jet",
          ),
          role: "Main",
          favorites: 2212,
          voiceActor: [
            VoiceActorDto(
                person: PersonDto(
                    malId: 357,
                    url: "https://myanimelist.net/people/357/Unshou_Ishizuka",
                    images: ImagesDto(
                        jpg: JpgDto(
                            imageUrl: "https://cdn.myanimelist.net/images/voiceactors/2/17135.jpg?s=5925123b8a7cf9b51a445c225442f0ef"
                        )
                    ),
                    name: "Ishizuka, Unshou"
                ),
                language: "Japanese"
            ),
            VoiceActorDto(
                person: PersonDto(
                  malId: 358,
                  url: "https://myanimelist.net/people/358/Beau_Billingslea",
                  images: ImagesDto(
                      jpg: JpgDto(
                        imageUrl: "https://cdn.myanimelist.net/images/voiceactors/3/43568.jpg?s=99aac1d18ec5b55645260c6395b1da08",
                      )
                  ),
                  name: "Billingslea, Beau",
                ),
                language: "English"
            ),
          ]
      );

      referenceRawJson = referenceDto.toRawJson();
    });

    test("should create CharacterDto instance to/from JSON", () {
      final createdDto = CharacterDto.fromRawJson(referenceRawJson);
      final json = createdDto.toRawJson();

      expect(createdDto, referenceDto);
      expect(json, referenceRawJson);
    });
  });
}