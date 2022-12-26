import 'package:data/models/pokemon_model.dart';
import 'package:data/repositories/pokemon/pokemon_repository.dart';

abstract class GetPokemonListUseCase {
  Future<List<PokemonModel>> call(int itemCount);
}

class GetPokemonListUseCaseImpl implements GetPokemonListUseCase {
  final PokemonRepository _pokemonRepository;

  GetPokemonListUseCaseImpl(this._pokemonRepository);

  @override
  Future<List<PokemonModel>> call(int itemCount) async {
    final response = await _pokemonRepository.fetchPokemonList(itemCount);
    final list = response['results'];
    final List<PokemonModel> pokemonList = [];
    for (var pokemon in list) {
      pokemonList.add(PokemonModel.fromMap(pokemon));
    }
    return pokemonList;
  }
}
