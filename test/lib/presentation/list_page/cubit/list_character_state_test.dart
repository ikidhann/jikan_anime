import 'package:flutter_test/flutter_test.dart';
import 'package:jikan_anime/domain/entity/anime_character/character.dart';
import 'package:jikan_anime/domain/entity/anime_character/character_data.dart';
import 'package:jikan_anime/presentation/list_page/cubit/list_character_cubit.dart';


void main() {
  group("ListCharacterState", () {
    test("copyWith creates a new instance with the provided values", () {
      final state = ListCharacterState(
        status: ListCharacterStatus.loading,
        characters: [Character(character: CharacterData(malId: 1))],
        currentId: 2,
      );

      final newState = state.copyWith(
        status: ListCharacterStatus.success,
        characters: [Character(character: CharacterData(malId: 2))],
        currentId: 3,
      );

      expect(newState.status, equals(ListCharacterStatus.success));
      expect(newState.characters.length, equals(1));
      expect(newState.characters[0].character!.malId!, equals(2));
      expect(newState.currentId, equals(3));
    });

    test("copyWith function maintain unchanged value", () {
      final state = ListCharacterState(
        status: ListCharacterStatus.loading,
        characters: [Character(character: CharacterData(malId: 1))],
        currentId: 2,
      );

      final newState = state.copyWith(
        status: ListCharacterStatus.success,);

      expect(newState.status, equals(ListCharacterStatus.success));
      expect(newState.characters.length, state.characters.length);
      expect(newState.characters[0].character!.malId!, state.characters[0].character!.malId!);
      expect(newState.currentId, state.currentId);
    });

    test("props returns a list of the object properties", () {
      final state = ListCharacterState(
        status: ListCharacterStatus.loading,
        characters: [Character(character: CharacterData(malId: 1))],
        currentId: 2,
      );

      final props = state.props;

      expect(props.length, equals(3));
      expect(props[0], equals(ListCharacterStatus.loading));
      expect(props[1], state.characters);
      expect(props[2], state.currentId);
    });

    test("equivalent instance have the same props", () {
      final state1 = ListCharacterState(
        status: ListCharacterStatus.loading,
        characters: [Character(character: CharacterData(malId: 1))],
        currentId: 2,
      );

      final state2 = ListCharacterState(
        status: ListCharacterStatus.loading,
        characters: [Character(character: CharacterData(malId: 1))],
        currentId: 2,
      );

      expect(state1.props, equals(state2.props));
    });

    test("distinct instance have different props", () {
      final state1 = ListCharacterState(
        status: ListCharacterStatus.loading,
        characters: [Character(character: CharacterData(malId: 1))],
        currentId: 2,
      );

      final state2 = ListCharacterState(
        status: ListCharacterStatus.success,
        characters: [Character(character: CharacterData(malId: 2))],
        currentId: 3,
      );

      expect(state1.props, isNot(equals(state2.props)));
    });
  });
}