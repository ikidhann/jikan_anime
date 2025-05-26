import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jikan_anime/data/repository/anime_character/character_repository_impl.dart';
import 'package:jikan_anime/data/source/local/local_storage.dart';
import 'package:jikan_anime/data/source/network/api.dart';
import 'package:jikan_anime/data/source/network/network_config.dart';
import 'package:jikan_anime/domain/usecase/anime_character/get_anime_characters_by_id.dart';
import 'package:jikan_anime/presentation/list_page/view/list_character_page.dart';
import 'package:jikan_anime/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// late SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await initNetwork();
  await initializeDependencies();

  // sharedPreferences = await SharedPreferences.getInstance();

  runApp(ProviderScope(child: AppRoot()));
}

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  // late GetAnimeCharacters _getAnimeCharacters;

  @override
  void initState() {
    super.initState();

    // final api = ApiImpl();
    // final localStorage = LocalStorageImpl(sharedPreferences: sharedPreferences);
    // final repository = CharacterRepositoryImpl(api: api, localStorage: localStorage);
    //
    // _getAnimeCharacters = GetAnimeCharacters(repository: repository);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "List Anime Character"
              ),
              actions: [
                Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Image.asset("assets/images/eye.png", height: 30, width: 30,)),
              ],
            ),
            body: RepositoryProvider.value(
              value: sl<GetAnimeCharacters>(),
              child: const ListCharacterPage(),
            ),
          );
        },
      ),
    );
  }
}
