import 'package:bloc_clean_arch/pokemon/models/pokemon_detail_model.dart';
import 'package:bloc_clean_arch/utils/string_extension.dart';
import 'package:flutter/material.dart';

class PokemonDetailWidget extends StatelessWidget {
  final PokemonDetailModel pokemon;

  const PokemonDetailWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Image.network(
              pokemon.sprites.other.officialArtwork.frontDefault,
              width: 72.0,
            ),
          ),
          _PokemonInfoWidget(pokemon: pokemon),
          Expanded(child: _PokemonDataWidget(pokemon: pokemon)),
          const Icon(Icons.favorite_border_outlined),
        ],
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
          _PokemonNameWidget(
            name: pokemon.name,
            id: pokemon.id,
          ),
          _PokemonTypesListWidget(pokemon: pokemon),
        ],
      ),
    );
  }
}

class _PokemonNameWidget extends StatelessWidget {
  final String name;
  final int id;

  const _PokemonNameWidget({
    Key? key,
    required this.id,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${name.toCapitalize()} ',
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
        ),
        Text(
          '#$id',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.5),
          ),
          textAlign: TextAlign.start,
        )
      ],
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
        itemBuilder: (_, index) {
          return Text(pokemon.types[index].type.name.toCapitalize());
        },
        separatorBuilder: (_, index) {
          return const Text(' - ');
        },
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

class _PokemonStatsWidget extends StatelessWidget {
  final PokemonDetailModel pokemon;

  const _PokemonStatsWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: pokemon.stats.length,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          final stat = pokemon.stats[index];
          return Row(
            children: [
              Text(
                stat.stat.name.toCapitalize(),
                style: const TextStyle(fontSize: 12.0),
              ),
              const Text(
                ' : ',
                style: TextStyle(fontSize: 12.0),
              ),
              Text(
                stat.baseStat.toString(),
                style: const TextStyle(fontSize: 12.0),
              ),
            ],
          );
        },
      ),
    );
  }
}
