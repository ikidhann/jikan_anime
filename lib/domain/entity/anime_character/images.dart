import 'package:equatable/equatable.dart';
import 'package:jikan_anime/domain/entity/anime_character/jpg.dart';

class Images with EquatableMixin {
  Images({this.jpg});

  final Jpg? jpg;

  @override
  List<Object?> get props => [jpg];
}
