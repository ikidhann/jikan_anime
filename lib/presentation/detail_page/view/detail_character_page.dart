import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jikan_anime/presentation/list_page/cubit/list_character_cubit.dart';

class DetailCharacterPage extends StatefulWidget {
  const DetailCharacterPage({super.key, required this.index});

  final int index;

  @override
  State<DetailCharacterPage> createState() => _DetailCharacterPageState();
}

class _DetailCharacterPageState extends State<DetailCharacterPage> {
  @override
  Widget build(BuildContext context) {
    final character = context.select((ListCharacterCubit c) => c.state.characters[widget.index].character);
    return Scaffold(
      body: Container(
        child: Text(
          character!.name!
        ),
      ),
    );
  }
}
