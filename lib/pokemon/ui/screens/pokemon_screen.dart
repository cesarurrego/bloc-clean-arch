import 'package:bloc_clean_arch/pokemon/ui/widgets/loading_widget.dart';
import 'package:bloc_clean_arch/pokemon/ui/widgets/pokemon_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_clean_arch/pokemon/bloc/pokemon_cubit.dart';
import 'package:bloc_clean_arch/pokemon/models/pokemon_detail_model.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemons'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: const _PokemonScreenContent(),
    );
  }
}

class _PokemonScreenContent extends StatelessWidget {
  const _PokemonScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonCubit, PokemonState>(
      builder: (context, state) {
        if (state.isLoading) return const PokemonLoading();
        return _PokemonList(list: state.pokemonList);
      },
    );
  }
}

class _PokemonList extends StatelessWidget {
  final List<PokemonDetailModel> list;

  const _PokemonList({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (_, index) => PokemonDetailWidget(pokemon: list[index]),
    );
  }
}
