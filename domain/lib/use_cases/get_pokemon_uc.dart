import 'package:data/models/pokemon_detail_model.dart';
import 'package:domain/use_cases/get_pokemon_info_uc.dart';
import 'package:domain/use_cases/get_pokemon_list_uc.dart';

abstract class GetPokemonUseCase {
  Future<List<PokemonDetailModel>> call(int itemCount);
}

class GetPokemonUseCaseImpl implements GetPokemonUseCase {
  final GetPokemonListUseCase _pokemonListUseCase;
  final GetPokemonInfoUseCase _pokemonDetailListUseCase;

  GetPokemonUseCaseImpl(this._pokemonListUseCase, this._pokemonDetailListUseCase);

  @override
  Future<List<PokemonDetailModel>> call(int itemCount) async {
    final pokemonList = await _pokemonListUseCase.call(itemCount);
    final pokemonDetailList = await _pokemonDetailListUseCase.call(pokemonList);
    return pokemonDetailList;
  }
}
