import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jikan_anime/domain/entity/anime_character/character.dart';
import 'package:jikan_anime/domain/usecase/anime_character/get_anime_characters_by_id.dart';
import 'package:jikan_anime/presentation/detail_page/view/detail_character_page.dart';
import 'package:jikan_anime/presentation/list_page/cubit/list_character_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ListCharacterPage extends StatelessWidget {
  const ListCharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => ListCharacterCubit(
            getAnimeCharacters: context.read<GetAnimeCharacters>(),
          )..fetchListCharacters(),
      child: CharacterView(),
    );
  }
}

class CharacterView extends StatelessWidget {
  const CharacterView({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select((ListCharacterCubit c) => c.state.status);
    return status == ListCharacterStatus.initial
        ? const Center(child: CircularProgressIndicator())
        : const Content();
  }
}

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    final listCharacter = context.select(
      (ListCharacterCubit c) => c.state.characters,
    );

    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: ListView.builder(
        itemCount: listCharacter.length,
        itemBuilder: (context, index) {
          final item = listCharacter[index];
          return CharacterItem(item: item, index: index,);
        },
      ),
    );
  }
}

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.item, required this.index});

  final Character item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) => DetailCharacterPage(index: index)));
      },
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  width: 50,
                  height: 50,
                  imageUrl: item.character!.images!.jpg!.imageUrl!,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: Text(
                    item.character!.name!
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 6),
              child: Text(
                "Voice Actor"
              ),
            ),
            ...item.voiceActor!.map((x) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  x.person!.name!,
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
