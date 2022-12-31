import 'package:core/api/api.abs.dart';
import 'package:data/models/pokemon_detail_model.dart';
import 'package:data/models/pokemon_model.dart';
import 'package:rxdart/rxdart.dart';

class PokemonRepository {
  final Api api;

  late int _offset = 0;
  final List<PokemonModel> _pokemonIdList = [];
  final _pokemonList = BehaviorSubject<List<PokemonDetailModel>>();

  Stream<List<PokemonDetailModel>> get listPokemonStream => _pokemonList;

  PokemonRepository(this.api) {
    _pokemonList.value = [];
    _offset = 0;
  }

  void _increaseOffset() {
    _offset += 10;
  }

  void _addPokemonIdList(List<PokemonModel> list) {
    _pokemonIdList.addAll(list);
  }

  void _emitPokemonList(List<PokemonDetailModel> list) {
    final pokemonList = [..._pokemonList.value, ...list];
    _pokemonList.add(pokemonList);
  }

  Future<void> fetchPokemons() async {
    final response = await api.get('/api/v2/pokemon', body: {
      'limit': '10',
      'offset': '$_offset',
    });
    final list = response['results'];
    final List<PokemonModel> pokemonList = [];
    for (var pokemon in list) {
      final pokemonId = PokemonModel.fromMap(pokemon);
      await fetchPokemonByName(pokemonId.name);
      pokemonList.add(pokemonId);
    }
    _increaseOffset();
    _addPokemonIdList(pokemonList);
  }

  Future<void> fetchPokemonByName(String pokemonName) async {
    final List<PokemonDetailModel> pokemonDetailList = [];
    final responseData = await api.get('/api/v2/pokemon/$pokemonName');
    final pokemonDetail = PokemonDetailModel.fromMap(responseData);
    pokemonDetailList.add(pokemonDetail);
    _emitPokemonList(pokemonDetailList);
  }
}
