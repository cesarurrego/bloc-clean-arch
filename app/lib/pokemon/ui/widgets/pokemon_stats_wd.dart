import 'package:bloc_clean_arch/utils/string_extension.dart';
import 'package:data/models/pokemon_detail_model.dart';
import 'package:flutter/material.dart';

class PokemonStatsWidget extends StatelessWidget {
  final PokemonDetailModel pokemon;

  const PokemonStatsWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: pokemon.stats.length,
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
