import 'package:equatable/equatable.dart';

class Jpg with EquatableMixin {
  Jpg({this.imageUrl});

  final String? imageUrl;

  @override
  List<Object?> get props => [imageUrl];
}
