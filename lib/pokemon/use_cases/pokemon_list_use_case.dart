import 'package:bloc_clean_arch/pokemon/models/pokemon_model.dart';
import 'package:bloc_clean_arch/pokemon/repository/pokemon_repository.dart';

abstract class PokemonListUseCase {
  Future<List<PokemonModel>> call(int itemCount);
}

class PokemonListUseCaseImpl implements PokemonListUseCase {
  final PokemonRepository _pokemonRepository;

  PokemonListUseCaseImpl(this._pokemonRepository);

  @override
  Future<List<PokemonModel>> call(int itemCount) async {
    final list = await _pokemonRepository.fetchPokemonList(itemCount);
    final List<PokemonModel> pokemonList = [];
    for (var pokemon in list) {
      pokemonList.add(PokemonModel.fromMap(pokemon));
    }
    return pokemonList;
  }
}
