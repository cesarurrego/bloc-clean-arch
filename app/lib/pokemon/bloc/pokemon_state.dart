part of 'pokemon_cubit.dart';

@immutable
abstract class PokemonState extends Equatable {
  final List<PokemonDetailModel> pokemonList;
  final bool isLoading;
  final bool isLoadingMore;
  final int listCount;

  const PokemonState({
    this.pokemonList = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.listCount = 10,
  });

  @override
  List<Object?> get props => [
        pokemonList,
        isLoading,
        listCount,
      ];
}

class PokemonInitial extends PokemonState {
  const PokemonInitial({
    super.pokemonList,
    super.isLoading,
    super.isLoadingMore,
    super.listCount,
  });

  PokemonInitial copyWith({
    List<PokemonDetailModel>? pokemonList,
    bool? isLoading,
    bool? isLoadingMore,
    int? listCount,
  }) =>
      PokemonInitial(
        pokemonList: pokemonList ?? this.pokemonList,
        isLoading: isLoading ?? this.isLoading,
        isLoadingMore: isLoadingMore ?? this.isLoadingMore,
        listCount: listCount ?? this.listCount,
      );
}
