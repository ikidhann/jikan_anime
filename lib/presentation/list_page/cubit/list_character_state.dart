part of 'list_character_cubit.dart';

enum ListCharacterStatus {
  initial,
  loading,
  success,
  failure,
}

class ListCharacterState extends Equatable {

  final ListCharacterStatus status;
  final List<Character> characters;
  final int currentId;

  const ListCharacterState({
    this.status = ListCharacterStatus.initial,
    this.characters = const [],
    this.currentId = 1
});

  ListCharacterState copyWith({
    ListCharacterStatus? status,
    List<Character>? characters,
    int? currentId,
}) {
    return ListCharacterState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      currentId: currentId ?? this.currentId
    );
  }

  @override
  List<Object?> get props => [
    status,
    characters,
    currentId,
  ];

}