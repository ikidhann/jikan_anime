import 'package:jikan_anime/domain/entity/anime_character/character.dart';
import 'package:jikan_anime/domain/repository/anime_character/character_repository.dart';

class GetAnimeCharacters{

  GetAnimeCharacters({
    required CharacterRepository repository
}) : _repository = repository;

  final CharacterRepository _repository;

  Future<List<Character>> call({int id = 1}) async {
    final list = await _repository.getCharacters(id: id);
    return list;
  }
}