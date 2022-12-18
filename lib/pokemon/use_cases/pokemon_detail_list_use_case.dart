import 'package:bloc_clean_arch/pokemon/models/pokemon_detail_model.dart';
import 'package:bloc_clean_arch/pokemon/models/pokemon_model.dart';
import 'package:bloc_clean_arch/pokemon/repository/pokemon_repository.dart';

abstract class PokemonDetailListUseCase {
  Future<List<PokemonDetailModel>> call(List<PokemonModel> pokemonList);
}

class PokemonDetailListUseCaseImpl implements PokemonDetailListUseCase {
  final PokemonRepository _pokemonRepository;

  PokemonDetailListUseCaseImpl(this._pokemonRepository);

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
