import 'package:equatable/equatable.dart';

import 'images.dart';

class CharacterData with EquatableMixin {
  CharacterData({this.malId, this.url, this.images, this.name});

  final int? malId;
  final String? url;
  final Images? images;
  final String? name;

  @override
  List<Object?> get props => [
    malId,
    url,
    images,
    name,
  ];
}