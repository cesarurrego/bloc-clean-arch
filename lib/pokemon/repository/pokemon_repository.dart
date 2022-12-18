import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class PokemonRepository {
  Future<List<dynamic>> fetchPokemonList(int maxNumber) async {
    var url = Uri.https('www.pokeapi.co', '/api/v2/pokemon', {'limit': '$maxNumber'});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse['results'];
    }
    return [];
  }

  Future<Map<String, dynamic>> fetchPokemonById(String pokemonName) async {
    var url = Uri.https('www.pokeapi.co', '/api/v2/pokemon/$pokemonName');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body) as Map<String, dynamic>;
    }
    return {};
  }
}
