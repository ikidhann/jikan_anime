import 'dart:convert';

import 'package:jikan_anime/data/dto/anime_character/voice_actor_dto.dart';
import 'package:jikan_anime/domain/entity/anime_character/character.dart';

import 'character_data_dto.dart';

class CharacterDto extends Character {
  CharacterDto({
    super.character,
    super.role,
    super.favorites,
    super.voiceActor,
  });

  // JSON
  factory CharacterDto.fromRawJson(String str) =>
  CharacterDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // Maps
  factory CharacterDto.fromMap(Map<String, dynamic> json) =>
      CharacterDto(
        character: json['character'] == null ? null : CharacterDataDto.fromMap(json['character']),
        role: json['role'],
        favorites: json['favorites'],
        voiceActor: json['voice_actors'] == null ? [] : List<VoiceActorDto>.from(json['voice_actors'].map((x) => VoiceActorDto.fromMap(x))),
      );

  Map<String, dynamic>  toMap() => {
    'character': character == null ? null : CharacterDataDto.fromCharacterData(character!).toMap(),
    'role': role,
    'favorites': favorites,
    'voice_actors': voiceActor == null ? [] : voiceActor!.map((x) => VoiceActorDto.fromVoiceActor(x).toMap()).toList(),
  };
}
