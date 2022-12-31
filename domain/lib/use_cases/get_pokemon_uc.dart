import 'package:data/models/pokemon_detail_model.dart';
import 'package:data/repositories/pokemon/pokemon_repository.dart';

abstract class GetPokemonUseCase {
  Future<List<PokemonDetailModel>> call();
}

class GetPokemonUseCaseImpl implements GetPokemonUseCase {
  final PokemonRepository _pokemonRepository;

  GetPokemonUseCaseImpl(this._pokemonRepository);

  @override
  Future<List<PokemonDetailModel>> call() async {
    await _pokemonRepository.fetchPokemons();
    return _pokemonRepository.listPokemonStream.take(1).last;
  }
}
