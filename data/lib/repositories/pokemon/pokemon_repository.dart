import 'package:core/api/api.abs.dart';

class PokemonRepository {
  final Api api;

  PokemonRepository(this.api);

  Future<Map<String, dynamic>> fetchPokemonList(int maxNumber) async {
    return await api.get('/api/v2/pokemon', body: {'limit': '$maxNumber'});
  }

  Future<Map<String, dynamic>> fetchPokemonById(String pokemonName) async {
    return await api.get('/api/v2/pokemon/$pokemonName');
  }
}
