import 'package:bloc_clean_arch/pokemon/models/pokemon_detail_model.dart';
import 'package:bloc_clean_arch/pokemon/use_cases/pokemon_detail_list_use_case.dart';
import 'package:bloc_clean_arch/pokemon/use_cases/pokemon_list_use_case.dart';

abstract class PokemonUseCase {
  Future<List<PokemonDetailModel>> call(int itemCount);
}

class PokemonUseCaseImpl implements PokemonUseCase {
  final PokemonListUseCase _pokemonListUseCase;
  final PokemonDetailListUseCase _pokemonDetailListUseCase;

  PokemonUseCaseImpl(this._pokemonListUseCase, this._pokemonDetailListUseCase);

  @override
  Future<List<PokemonDetailModel>> call(int itemCount) async {
    final pokemonList = await _pokemonListUseCase.call(itemCount);
    final pokemonDetailList = await _pokemonDetailListUseCase.call(pokemonList);
    return pokemonDetailList;
  }
}
