import 'package:flutter/cupertino.dart';
import 'package:jikan_anime/data/dto/anime_character/character_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cachedCharacterListKey = 'CACHED_CHARACTER_LIST_ID';

abstract class LocalStorage {
  Future<bool> saveCharactersId({
    required int id,
    required List<CharacterDto> list,
  });

  List<CharacterDto> loadCharactersId({required int id});
}

class LocalStorageImpl implements LocalStorage{
  final SharedPreferences _sharedPref;

  LocalStorageImpl({
   required SharedPreferences sharedPreferences,
}) : _sharedPref = sharedPreferences;


  @override
  List<CharacterDto> loadCharactersId({required int id}) {
    final key = getKeyToId(id);
    final jsonList = _sharedPref.getStringList(key);

    return jsonList != null
        ? jsonList.map((x) => CharacterDto.fromRawJson(x)).toList()
        : [];
  }

  @override
  Future<bool> saveCharactersId({required int id, required List<CharacterDto> list,}) {
    final jsonList = list.map((x) => x.toRawJson()).toList();
    final key = getKeyToId(id);
    return _sharedPref.setStringList(key, jsonList);
  }

  @visibleForTesting
  static String getKeyToId(int id) {
    return '${cachedCharacterListKey}_$id';
  }
}
