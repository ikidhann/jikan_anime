import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jikan_anime/domain/entity/anime_character/character.dart';
import 'package:jikan_anime/domain/usecase/anime_character/get_anime_characters_by_id.dart';

part 'list_character_state.dart';

class ListCharacterCubit extends Cubit<ListCharacterState> {
  final GetAnimeCharacters _getAnimeCharacters;
  // bool _isThrottling = false;
  // static const Duration throttleDuration = Duration(milliseconds: 100);

  ListCharacterCubit({
   required GetAnimeCharacters getAnimeCharacters,
}) : _getAnimeCharacters = getAnimeCharacters,
  super(const ListCharacterState());

  Future<void> fetchListCharacters() async {
    emit(state.copyWith(status: ListCharacterStatus.loading));

    try {
      final listCharacters = await _getAnimeCharacters(id: state.currentId);

      emit(state.copyWith(
        status: ListCharacterStatus.success,
        currentId: state.currentId + 1,
        characters: List.of(state.characters)..addAll(listCharacters)
      ));
    } catch (e) {
      emit(state.copyWith(status: ListCharacterStatus.failure));
    }
  }

}