import 'package:bloc/bloc.dart';
import 'package:data/models/pokemon_detail_model.dart';
import 'package:domain/use_cases/get_pokemon_uc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final GetPokemonUseCase _pokemonUseCase;

  PokemonCubit(this._pokemonUseCase) : super(const PokemonInitial()) {
    fetchPokemons();
  }

  Future<void> fetchPokemons() async {
    final currentState = state as PokemonInitial;
    if (state.pokemonList.isEmpty) {
      emit(currentState.copyWith(isLoading: true));
    }
    final pokemonList = await _pokemonUseCase.call();
    emit(currentState.copyWith(
      pokemonList: pokemonList,
      isLoading: false,
    ));
  }
}
