import 'dart:convert';

import 'package:jikan_anime/data/dto/anime_character/person_dto.dart';
import 'package:jikan_anime/domain/entity/anime_character/voice_actor.dart';

class VoiceActorDto extends VoiceActor {
  VoiceActorDto({
    super.person,
    super.language,
});

  // JSON
  factory VoiceActorDto.fromRawJson(String str) =>
  VoiceActorDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // Maps
  factory VoiceActorDto.fromMap(Map<String, dynamic> json) =>
  VoiceActorDto(
    person: json['person'] == null ? null : PersonDto.fromMap(json['person']),
    language: json['language']
  );

  Map<String, dynamic> toMap() => {
    'person': person == null ? null : PersonDto.fromPerson(person!).toMap(),
    'language': language,
  };

  // Domain
  static VoiceActorDto fromVoiceActor(VoiceActor voiceActor) {
    return VoiceActorDto(
      person: voiceActor.person,
      language: voiceActor.language,
    );
  }

  VoiceActor toVoiceActor() {
    return VoiceActor(
      person: person,
      language: language
    );
  }
}