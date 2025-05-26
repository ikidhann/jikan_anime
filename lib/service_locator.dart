import 'package:get_it/get_it.dart';
import 'package:jikan_anime/data/repository/anime_character/character_repository_impl.dart';
import 'package:jikan_anime/data/source/local/local_storage.dart';
import 'package:jikan_anime/data/source/network/api.dart';
import 'package:jikan_anime/domain/repository/anime_character/character_repository.dart';
import 'package:jikan_anime/domain/usecase/anime_character/get_anime_characters_by_id.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  /// Services
  // Api
  sl.registerSingleton<Api>(ApiImpl());

  // LocalStorage
  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerSingleton<SharedPreferences>(sharedPreferences);
  sl.registerSingleton<LocalStorage>(
    LocalStorageImpl(sharedPreferences: sl<SharedPreferences>()),
  );

  /// Repositories
  // CharacterRepository
  sl.registerSingleton<CharacterRepository>(
    CharacterRepositoryImpl(api: sl<Api>(), localStorage: sl<LocalStorage>()),
  );

  /// Usecases
  // GetAnimeCharacters
  sl.registerSingleton<GetAnimeCharacters>(
    GetAnimeCharacters(repository: sl<CharacterRepository>()),
  );
}
