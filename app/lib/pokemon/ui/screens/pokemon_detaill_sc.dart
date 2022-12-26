import 'package:bloc_clean_arch/pokemon/ui/widgets/pokemon_image_wd.dart';
import 'package:bloc_clean_arch/pokemon/ui/widgets/pokemon_stats_wd.dart';
import 'package:bloc_clean_arch/pokemon/ui/widgets/pokemon_title_wd.dart';
import 'package:data/models/pokemon_detail_model.dart';
import 'package:flutter/material.dart';

class PokemonDetail extends StatelessWidget {
  final PokemonDetailModel pokemon;

  const PokemonDetail({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = pokemon.sprites.other.officialArtwork.frontDefault;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemons'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PokemonImageWidget(
                imageUrl: image,
                scale: 2.0,
              ),
              PokemonNameWidget(
                name: pokemon.name,
                id: pokemon.id,
                size: 28.0,
              ),
              PokemonStatsWidget(
                pokemon: pokemon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
