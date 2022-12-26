import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc_clean_arch/pokemon/models/pokemon_detail_model.dart';
import 'package:bloc_clean_arch/pokemon/use_cases/pokemon_use_case.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final PokemonUseCase _pokemonUseCase;

  PokemonCubit(this._pokemonUseCase) : super(const PokemonInitial()) {
    fetchPokemons();
  }

  Future<void> fetchPokemons() async {
    final currentState = state as PokemonInitial;
    emit(currentState.copyWith(isLoading: true));
    final pokemonList = await _pokemonUseCase.call(10);
    emit(currentState.copyWith(
      pokemonList: pokemonList,
      isLoading: false,
    ));
  }

  Future<void> loadMorePokemons() async {
    print('cosito de carga');
    final currentState = state as PokemonInitial;
    emit(currentState.copyWith(isLoadingMore: true));
    await Future.delayed(const Duration(milliseconds: 5000));
    emit(currentState.copyWith(isLoadingMore: false));
    print('termina cosito de carga');
  }
}
