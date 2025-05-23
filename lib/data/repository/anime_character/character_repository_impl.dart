import 'package:jikan_anime/data/source/local/local_storage.dart';
import 'package:jikan_anime/data/source/network/api.dart';
import 'package:jikan_anime/domain/entity/anime_character/character.dart';
import 'package:jikan_anime/domain/repository/anime_character/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final Api _api;
  final LocalStorage _localStorage;

  CharacterRepositoryImpl({
    required Api api,
    required LocalStorage localStorage,
}) : _api = api,
  _localStorage = localStorage;

  @override
  Future<List<Character>> getCharacters({int id = 1}) async {
    final cachedList = _localStorage.loadCharactersId(id: id);
    if (cachedList.isNotEmpty) {
      print("Cached Not Empty");
      return cachedList;
    }

    final fetchedList = await _api.loadCharacters(id: id);
    await _localStorage.saveCharactersId(id: id, list: fetchedList);
    return fetchedList;
  }

}