import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jikan_anime/presentation/list_page/cubit/list_character_cubit.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../../../fixtures/fixtures.dart';
import '../../helper/pump_app.dart';

void main() {
  group("ListCharacterCubit", () {
    late GetAnimeCharactersMock getAnimeCharactersMock;
    late ListCharacterCubit cubit;

    setUp(() {
      getAnimeCharactersMock = GetAnimeCharactersMock();
      cubit = ListCharacterCubit(getAnimeCharacters: getAnimeCharactersMock);
    });

    test("should have correct initial state", () {
      const expected = ListCharacterState(
        status: ListCharacterStatus.initial,
        characters: [],
        currentId: 1
      );

      expect(ListCharacterCubit(getAnimeCharacters: getAnimeCharactersMock).state, expected);
    });

    group("fetchListCharacter", () {
      blocTest<ListCharacterCubit, ListCharacterState>("emit loading -> runs useCase -> emit success",
      build: () => cubit,
        setUp: () {
        when(() => getAnimeCharactersMock(id: 1)).thenAnswer((_) async => characterList);
        },
        act: (cubit) => cubit.fetchListCharacters(),
      expect: () => [
        const ListCharacterState(
          status: ListCharacterStatus.loading,
        ),
        ListCharacterState(
          status: ListCharacterStatus.success,
          characters: characterList,
          currentId: 2
        )
      ],
        verify: (_) {
        verify(() => getAnimeCharactersMock.call(id: 1));
        verifyNoMoreInteractions(getAnimeCharactersMock);
        }
      );
    });
  });
}