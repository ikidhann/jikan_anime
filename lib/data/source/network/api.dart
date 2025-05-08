import 'package:dio/dio.dart';
import 'package:jikan_anime/data/source/network/constant.dart';

import '../../../domain/entity/anime_character/character_data.dart';
import '../../dto/anime_character/character_dto.dart';
import 'network_config.dart';

abstract class Api {
  Future<List<CharacterDto>> loadCharacters({int id = 1});
}

class ApiImpl implements Api {
  NetworkRequestConfig networkRequestConfig = NetworkRequestConfig();

  @override
  Future<List<CharacterDto>> loadCharacters({int id = 1}) async {
    try {
      final response = await networkRequestConfig.doGet("anime/$id/characters");
      print("FETCH ID: $id");

      final listCharacters =
          (response.data!['data'] as List<dynamic>)
              .map((x) => CharacterDto.fromMap(x))
              .toList();

      return listCharacters;
    } on DioException catch (e) {
      print("=====ERROR=====");
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        if (e.response?.statusCode == 404) return [];
      } else {
        print("ERROR lain");
        print(e);
      }
    }

    return [];
  }
}
