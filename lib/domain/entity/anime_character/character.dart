import 'package:equatable/equatable.dart';
import 'package:jikan_anime/domain/entity/anime_character/character_data.dart';
import 'package:jikan_anime/domain/entity/anime_character/voice_actor.dart';

class Character with EquatableMixin {
  Character({this.character, this.role, this.favorites, this.voiceActor});

  final CharacterData? character;
  final String? role;
  final int? favorites;
  final List<VoiceActor>? voiceActor;

  @override
  List<Object?> get props => [
    character,
    role,
    favorites,
    voiceActor,
  ];
}
