import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jikan_anime/domain/usecase/anime_character/get_anime_characters_by_id.dart';
import 'package:mockingjay/mockingjay.dart';

class GetAnimeCharactersMock extends Mock implements GetAnimeCharacters {}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    MockNavigator? navigator,
    GetAnimeCharacters? getAnimeCharacters,
  }) {
    final innerChild = Scaffold(body: widget);

    return pumpWidget(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: getAnimeCharacters ?? GetAnimeCharactersMock(),
          ),
        ],
        child: MaterialApp(
          home:
              navigator == null
                  ? innerChild
                  : MockNavigatorProvider(
                    navigator: navigator,
                    child: innerChild,
                  ),
        ),
      ),
    );
  }
}
