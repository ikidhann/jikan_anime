import 'package:flutter_test/flutter_test.dart';
import 'package:jikan_anime/data/source/local/local_storage.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixtures.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() async {
  late LocalStorageImpl localStorage;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() async {
    mockSharedPreferences = MockSharedPreferences();
    localStorage = LocalStorageImpl(sharedPreferences: mockSharedPreferences);
  });

  group('LocalStorageImpl', () {
    test("should save a list of CharacterDto per id", () async {
      when(() => mockSharedPreferences.setStringList(any(), any()))
          .thenAnswer((_) async => true);

      final result = await localStorage.saveCharactersId(id: 1, list: characterList);

      expect(result, true);

      final key = LocalStorageImpl.getKeyToId(1);
      final listRaw = characterList.map((x) => x.toRawJson()).toList();

      verify(() => mockSharedPreferences.setStringList(key, listRaw)).called(1);

      verifyNoMoreInteractions(mockSharedPreferences);
    });

    test("should load a list of CharacterDto per id", () {
      final key = LocalStorageImpl.getKeyToId(1);

      when(() => mockSharedPreferences.getStringList(key)).thenReturn(
        characterList.map((x) => x.toRawJson()).toList(),
      );

      final result = localStorage.loadCharactersId(id: 1);

      expect(result, hasLength(2));
      for (int i = 0 ; i < characterList.length ; i++) {
        expect(result[i], characterList[i]);
      }

      verify(() => mockSharedPreferences.getStringList(key)).called(1);
      verifyNoMoreInteractions(mockSharedPreferences);
    });
  });
}