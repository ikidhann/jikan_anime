import 'package:flutter_test/flutter_test.dart';
import 'package:jikan_anime/domain/entity/anime_character/character.dart';
import 'package:jikan_anime/domain/entity/anime_character/character_data.dart';
import 'package:jikan_anime/domain/entity/anime_character/images.dart';
import 'package:jikan_anime/domain/entity/anime_character/jpg.dart';
import 'package:jikan_anime/domain/repository/anime_character/character_repository.dart';
import 'package:jikan_anime/domain/usecase/anime_character/get_anime_characters_by_id.dart';
import 'package:mockingjay/mockingjay.dart';

class MockCharacterRepository extends Mock implements CharacterRepository {}

void main() {
  late GetAnimeCharacters getAnimeCharacters;
  late MockCharacterRepository mockCharacterRepository;

  setUp(() {
    mockCharacterRepository = MockCharacterRepository();
    getAnimeCharacters = GetAnimeCharacters(repository: mockCharacterRepository);
  });

  group("GetAnimeCharactersById", () {
    test("call should return a list of characters", () async {
      const id = 1;
      final characters = [
        Character(
          character: CharacterData(
            malId: 3,
            url: "https://myanimelist.net/character/3/Jet_Black",
            images: Images(
                jpg: Jpg(
                    imageUrl: "https://cdn.myanimelist.net/images/characters/11/253723.jpg?s=6c8a19a79a88c46ae15f30e3ef5fd839"
                )
            ),
            name: "Black, Jet",
          ),
          role: "Main",
          favorites: 100
        ),
        Character(
            character: CharacterData(
              malId: 1,
              url: "https://myanimelist.net/character/1/Spike_Spiegel",
              images: Images(
                  jpg: Jpg(
                      imageUrl: "https://cdn.myanimelist.net/images/characters/11/516853.jpg?s=c73c8218a6f307bfb0b4e5e35029991a"
                  )
              ),
              name: "Spiegel, Spike",
            ),
            role: "Main",
            favorites: 100
        )
      ];

      when(() => mockCharacterRepository.getCharacters(id: id)).thenAnswer((_) async => characters);

      final result = await getAnimeCharacters.call(id: id);

      expect(result, equals(characters));

      verify(() => mockCharacterRepository.getCharacters(id: id)).called(1);
      verifyNoMoreInteractions(mockCharacterRepository);
    });
  });
}