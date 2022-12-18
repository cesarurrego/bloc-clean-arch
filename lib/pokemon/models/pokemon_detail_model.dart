import 'dart:convert';

class PokemonDetailModel {
  final int id;
  final String name;
  final int order;
  final _Species species;
  final _Sprites sprites;
  final List<Stat> stats;
  final List<_Type> types;
  final int weight;
  final int height;

  const PokemonDetailModel({
    this.id = 0,
    this.name = '',
    this.order = 0,
    this.species = const _Species(),
    this.sprites = const _Sprites(),
    this.stats = const [],
    this.types = const [],
    this.weight = 0,
    this.height = 0,
  });

  factory PokemonDetailModel.fromJson(String str) => PokemonDetailModel.fromMap(json.decode(str));

  factory PokemonDetailModel.fromMap(Map<String, dynamic> json) => PokemonDetailModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        order: json["order"] ?? 0,
        species: json["species"] != null ? _Species.fromMap(json["species"]) : const _Species(),
        sprites: json["sprites"] != null ? _Sprites.fromMap(json["sprites"]) : const _Sprites(),
        stats: json["types"] != null ? List<Stat>.from(json["stats"].map((x) => Stat.fromMap(x))) : const [],
        types: json["types"] != null ? List<_Type>.from(json["types"].map((x) => _Type.fromMap(x))) : const [],
        weight: json["weight"] ?? 0,
        height: json["height"] ?? 0,
      );
}

class _Species {
  const _Species({
    this.name = '',
    this.url = '',
  });

  final String name;
  final String url;

  factory _Species.fromJson(String str) => _Species.fromMap(json.decode(str));

  factory _Species.fromMap(Map<String, dynamic> json) => _Species(
        name: json["name"] ?? '',
        url: json["url"] ?? '',
      );
}

class _Sprites {
  const _Sprites({
    this.other = const Other(),
  });

  final Other other;

  factory _Sprites.fromJson(String str) => _Sprites.fromMap(json.decode(str));

  factory _Sprites.fromMap(Map<String, dynamic> json) => _Sprites(
        other: Other.fromMap(json["other"]),
      );
}

class Other {
  const Other({
    this.officialArtwork = const OfficialArtwork(),
  });

  final OfficialArtwork officialArtwork;

  factory Other.fromJson(String str) => Other.fromMap(json.decode(str));

  factory Other.fromMap(Map<String, dynamic> json) => Other(
        officialArtwork: json["official-artwork"] != null
            ? OfficialArtwork.fromMap(json["official-artwork"])
            : const OfficialArtwork(),
      );
}

class OfficialArtwork {
  const OfficialArtwork({
    this.frontDefault = '',
  });

  final String frontDefault;

  factory OfficialArtwork.fromJson(String str) => OfficialArtwork.fromMap(json.decode(str));

  factory OfficialArtwork.fromMap(Map<String, dynamic> json) => OfficialArtwork(
        frontDefault: json["front_default"] ?? '',
      );
}

class Stat {
  const Stat({
    this.baseStat = 0,
    this.effort = 0,
    this.stat = const _Species(),
  });

  final int baseStat;
  final int effort;
  final _Species stat;

  factory Stat.fromJson(String str) => Stat.fromMap(json.decode(str));

  factory Stat.fromMap(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"] ?? 0,
        effort: json["effort"] ?? 0,
        stat: json["stat"] != null ? _Species.fromMap(json["stat"]) : const _Species(),
      );
}

class _Type {
  const _Type({
    this.slot = 0,
    this.type = const _Species(),
  });

  final int slot;
  final _Species type;

  factory _Type.fromJson(String str) => _Type.fromMap(json.decode(str));

  factory _Type.fromMap(Map<String, dynamic> json) => _Type(
        slot: json["slot"] ?? 0,
        type: json["type"] != null ? _Species.fromMap(json["type"]) : const _Species(),
      );
}
