
import 'package:data/models/pokemon_detail_model.dart';
import 'package:data/models/pokemon_model.dart';
import 'package:data/repositories/pokemon/pokemon_repository.dart';

abstract class GetPokemonInfoUseCase {
  Future<List<PokemonDetailModel>> call(List<PokemonModel> pokemonList);
}

class GetPokemonInfoUseCaseImpl implements GetPokemonInfoUseCase {
  final PokemonRepository _pokemonRepository;

  GetPokemonInfoUseCaseImpl(this._pokemonRepository);

  @override
  Future<List<PokemonDetailModel>> call(List<PokemonModel> pokemonList) async {
    final List<PokemonDetailModel> pokemonDetailList = [];
    try {
      for (var pokemon in pokemonList) {
        final responseData = await _pokemonRepository.fetchPokemonById(pokemon.name);
        final pokemonDetail = PokemonDetailModel.fromMap(responseData);
        pokemonDetailList.add(pokemonDetail);
      }
    } catch (err) {
      print(err.toString());
    }
    return pokemonDetailList;
  }
}
