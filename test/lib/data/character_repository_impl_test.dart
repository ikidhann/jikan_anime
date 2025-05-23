import 'package:flutter_test/flutter_test.dart';
import 'package:jikan_anime/data/repository/anime_character/character_repository_impl.dart';
import 'package:jikan_anime/data/source/local/local_storage.dart';
import 'package:jikan_anime/data/source/network/api.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../fixtures/fixtures.dart';

class MockApi extends Mock implements Api {}

class MockLocalStorage extends Mock implements LocalStorageImpl {}

void main() {
  late CharacterRepositoryImpl characterRepository;
  late MockApi mockApi;
  late MockLocalStorage mockLocalStorage;

  setUp(() {
    mockApi = MockApi();
    mockLocalStorage = MockLocalStorage();
    characterRepository = CharacterRepositoryImpl(api: mockApi, localStorage: mockLocalStorage,);
  });

  group("CharacterRepositoryImpl", () {
    test("getCharacters should return cached characters if available", () async {
      const id = 1;
      final cachedCharacters = characterList;
      when(() => mockLocalStorage.loadCharactersId(id: id)).thenReturn(cachedCharacters);

      final result = await characterRepository.getCharacters(id: id);

      expect(result, equals(cachedCharacters));

      verify(() => mockLocalStorage.loadCharactersId(id: id)).called(1);
      verifyNoMoreInteractions(mockLocalStorage);
      verifyZeroInteractions(mockApi);
    });

    test('getCHaracters should fetch characters from API and save to local storage', () async {
      const id = 1;
      final apiCharacters = characterList;

      when(() => mockLocalStorage.loadCharactersId(id: id)).thenReturn([]);
      when(() => mockApi.loadCharacters(id: id)).thenAnswer((_) async => apiCharacters);
      when(() => mockLocalStorage.saveCharactersId(id: id, list: apiCharacters)).thenAnswer((_) async => true);

      final result = await characterRepository.getCharacters(id: id);

      expect(result, equals(apiCharacters));
      verify(() => mockLocalStorage.loadCharactersId(id: id)).called(1);
      verify(() => mockApi.loadCharacters(id: id)).called(1);
      verify(() => mockLocalStorage.saveCharactersId(id: id, list: apiCharacters)).called(1);
      verifyNoMoreInteractions(mockLocalStorage);
      verifyNoMoreInteractions(mockApi);
    });
  });
}