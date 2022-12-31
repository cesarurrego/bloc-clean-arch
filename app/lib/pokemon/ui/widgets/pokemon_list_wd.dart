import 'package:bloc_clean_arch/pokemon/bloc/pokemon_cubit.dart';
import 'package:bloc_clean_arch/pokemon/ui/widgets/pokemon_detail_wd.dart';
import 'package:data/models/pokemon_detail_model.dart';
import 'package:design/widgets/loading/circular_loading_wd.dart';
import 'package:flutter/material.dart';

class PokemonList extends StatefulWidget {
  final PokemonCubit pokemonCubit;
  final List<PokemonDetailModel> list;

  const PokemonList({
    Key? key,
    required this.list,
    required this.pokemonCubit,
  }) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late final ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        widget.pokemonCubit.fetchPokemons();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: widget.list.length + 1,
      itemBuilder: (_, index) {
        if (index < widget.list.length) {
          final pokemon = widget.list[index];
          return PokemonDetailWidget(pokemon: pokemon);
        }
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 32.0),
          child: PokeBallLoading(),
        );
      },
    );
  }
}
