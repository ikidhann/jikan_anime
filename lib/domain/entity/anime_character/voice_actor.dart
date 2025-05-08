import 'package:equatable/equatable.dart';
import 'package:jikan_anime/domain/entity/anime_character/person.dart';

class VoiceActor with EquatableMixin {
  VoiceActor({this.person, this.language});

  final Person? person;
  final String? language;

  @override
  List<Object?> get props => [
    person,
    language,
  ];
}
