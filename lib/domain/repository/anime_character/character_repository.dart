import 'package:jikan_anime/domain/entity/anime_character/character.dart';

abstract class CharacterRepository{
  Future<List<Character>> getCharacters({int id = 1});
}