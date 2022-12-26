import 'package:bloc_clean_arch/pokemon/ui/screens/pokemon_detaill_sc.dart';
import 'package:bloc_clean_arch/pokemon/ui/widgets/pokemon_image_wd.dart';
import 'package:bloc_clean_arch/pokemon/ui/widgets/pokemon_title_wd.dart';
import 'package:bloc_clean_arch/utils/string_extension.dart';
import 'package:data/models/pokemon_detail_model.dart';
import 'package:flutter/material.dart';

class PokemonDetailWidget extends StatelessWidget {
  final PokemonDetailModel pokemon;

  const PokemonDetailWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = pokemon.sprites.other.officialArtwork.frontDefault;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => PokemonDetail(pokemon: pokemon)));
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: PokemonImageWidget(imageUrl: imageUrl),
              ),
              _PokemonInfoWidget(pokemon: pokemon),
              Expanded(child: _PokemonDataWidget(pokemon: pokemon)),
              const Icon(Icons.favorite_border_outlined),
            ],
          ),
        ),
      ),
    );
  }
}

class _PokemonInfoWidget extends StatelessWidget {
  final PokemonDetailModel pokemon;

  const _PokemonInfoWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PokemonNameWidget(
            name: pokemon.name,
            id: pokemon.id,
          ),
          _PokemonTypesListWidget(pokemon: pokemon),
        ],
      ),
    );
  }
}

class _PokemonTypesListWidget extends StatelessWidget {
  final PokemonDetailModel pokemon;

  const _PokemonTypesListWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => Text(pokemon.types[index].type.name.toCapitalize()),
        separatorBuilder: (_, index) => const Text(' - '),
        itemCount: pokemon.types.length,
      ),
    );
  }
}

class _PokemonDataWidget extends StatelessWidget {
  final PokemonDetailModel pokemon;

  const _PokemonDataWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Weight: ${pokemon.weight.toString()} gr'),
          Text('Height: ${pokemon.height.toString()} cm'),
        ],
      ),
    );
  }
}
