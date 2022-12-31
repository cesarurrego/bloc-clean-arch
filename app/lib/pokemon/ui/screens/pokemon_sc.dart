import 'package:bloc_clean_arch/di/service_locator.dart';
import 'package:bloc_clean_arch/pokemon/bloc/pokemon_cubit.dart';
import 'package:bloc_clean_arch/pokemon/ui/widgets/pokemon_list_wd.dart';
import 'package:design/widgets/loading/circular_loading_wd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  final PokemonCubit _pokemonCubit = ServiceLocator.get<PokemonCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemons'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: BlocProvider(
        create: (_) => _pokemonCubit,
        child: _PokemonScreenContent(pokemonCubit: _pokemonCubit),
      ),
    );
  }
}

class _PokemonScreenContent extends StatelessWidget {
  final PokemonCubit pokemonCubit;

  const _PokemonScreenContent({
    Key? key,
    required this.pokemonCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonCubit, PokemonState>(
      builder: (context, state) {
        if (state.isLoading) return const PokeBallLoading();
        return PokemonList(
          list: state.pokemonList,
          pokemonCubit: pokemonCubit,
        );
      },
    );
  }
}
