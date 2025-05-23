import 'package:jikan_anime/data/dto/anime_character/character_data_dto.dart';
import 'package:jikan_anime/data/dto/anime_character/character_dto.dart';
import 'package:jikan_anime/data/dto/anime_character/images_dto.dart';
import 'package:jikan_anime/data/dto/anime_character/jpg_dto.dart';
import 'package:jikan_anime/data/dto/anime_character/person_dto.dart';
import 'package:jikan_anime/data/dto/anime_character/voice_actor_dto.dart';
import 'package:jikan_anime/domain/entity/anime_character/voice_actor.dart';

final characterDto = CharacterDto(
  character: CharacterDataDto(
    malId: 3,
    url: "https://myanimelist.net/character/3/Jet_Black",
    images: ImagesDto(
      jpg: JpgDto(
        imageUrl: "https://cdn.myanimelist.net/images/characters/11/253723.jpg?s=6c8a19a79a88c46ae15f30e3ef5fd839"
      )
    ),
    name: "Black, Jet",
  ),
  role: "Main",
  favorites: 2212,
  voiceActor: [
    VoiceActorDto(
        person: PersonDto(
            malId: 357,
            url: "https://myanimelist.net/people/357/Unshou_Ishizuka",
            images: ImagesDto(
                jpg: JpgDto(
                    imageUrl: "https://cdn.myanimelist.net/images/voiceactors/2/17135.jpg?s=5925123b8a7cf9b51a445c225442f0ef"
                )
            ),
            name: "Ishizuka, Unshou"
        ),
        language: "Japanese"
    ),
    VoiceActorDto(
      person: PersonDto(
        malId: 358,
        url: "https://myanimelist.net/people/358/Beau_Billingslea",
        images: ImagesDto(
          jpg: JpgDto(
            imageUrl: "https://cdn.myanimelist.net/images/voiceactors/3/43568.jpg?s=99aac1d18ec5b55645260c6395b1da08",
          )
        ),
        name: "Billingslea, Beau",
      ),
      language: "English"
    ),
  ]
);

final characterList = [
  CharacterDto(
      character: CharacterDataDto(
        malId: 3,
        url: "https://myanimelist.net/character/3/Jet_Black",
        images: ImagesDto(
            jpg: JpgDto(
                imageUrl: "https://cdn.myanimelist.net/images/characters/11/253723.jpg?s=6c8a19a79a88c46ae15f30e3ef5fd839"
            )
        ),
        name: "Black, Jet",
      ),
      role: "Main",
      favorites: 2212,
      voiceActor: [
        VoiceActorDto(
            person: PersonDto(
                malId: 357,
                url: "https://myanimelist.net/people/357/Unshou_Ishizuka",
                images: ImagesDto(
                    jpg: JpgDto(
                        imageUrl: "https://cdn.myanimelist.net/images/voiceactors/2/17135.jpg?s=5925123b8a7cf9b51a445c225442f0ef"
                    )
                ),
                name: "Ishizuka, Unshou"
            ),
            language: "Japanese"
        ),
        VoiceActorDto(
            person: PersonDto(
              malId: 358,
              url: "https://myanimelist.net/people/358/Beau_Billingslea",
              images: ImagesDto(
                  jpg: JpgDto(
                    imageUrl: "https://cdn.myanimelist.net/images/voiceactors/3/43568.jpg?s=99aac1d18ec5b55645260c6395b1da08",
                  )
              ),
              name: "Billingslea, Beau",
            ),
            language: "English"
        ),
      ]
  ),
  CharacterDto(
      character: CharacterDataDto(
        malId: 1,
        url: "https://myanimelist.net/character/1/Spike_Spiegel",
        images: ImagesDto(
            jpg: JpgDto(
                imageUrl: "https://cdn.myanimelist.net/images/characters/11/516853.jpg?s=c73c8218a6f307bfb0b4e5e35029991a"
            )
        ),
        name: "Spiegel, Spike",
      ),
      role: "Main",
      favorites: 47890,
      voiceActor: [
        VoiceActorDto(
            person: PersonDto(
                malId: 11,
                url: "https://myanimelist.net/people/11/Kouichi_Yamadera",
                images: ImagesDto(
                    jpg: JpgDto(
                        imageUrl: "https://cdn.myanimelist.net/images/voiceactors/2/73614.jpg?s=643eee95220ed1edde3cb796861fafec"
                    )
                ),
                name: "Yamadera, Kouichi"
            ),
            language: "Japanese"
        ),
        VoiceActorDto(
            person: PersonDto(
              malId: 12,
              url: "https://myanimelist.net/people/12/Steven_Blum",
              images: ImagesDto(
                  jpg: JpgDto(
                    imageUrl: "https://cdn.myanimelist.net/images/voiceactors/3/45741.jpg?s=aa17bdbac0dfac05cb2adf78ededab69",
                  )
              ),
              name: "Blum, Steven",
            ),
            language: "English"
        ),
      ]
  )
];