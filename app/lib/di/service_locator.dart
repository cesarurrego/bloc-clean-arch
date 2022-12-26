import 'package:get_it/get_it.dart';
import 'package:bloc_clean_arch/pokemon/repository/pokemon_repository.dart';
import 'package:bloc_clean_arch/pokemon/use_cases/pokemon_detail_list_use_case.dart';
import 'package:bloc_clean_arch/pokemon/use_cases/pokemon_list_use_case.dart';
import 'package:bloc_clean_arch/pokemon/use_cases/pokemon_use_case.dart';

class ServiceLocator {

  static final _getIt = GetIt.instance;

  static T get<T extends Object>() {
    return _getIt.get();
  }

  Future<void> init() async {
    _initRepositories();
    _initUseCases();
  }

  void _initRepositories() {
    _getIt.registerLazySingleton(() => PokemonRepository());
  }

  void _initUseCases() {
    _getIt.registerFactory<PokemonListUseCase>(() => PokemonListUseCaseImpl(_getIt.get()));
    _getIt.registerFactory<PokemonDetailListUseCase>(() => PokemonDetailListUseCaseImpl(_getIt.get()));
    _getIt.registerFactory<PokemonUseCase>(() => PokemonUseCaseImpl(_getIt.get(), _getIt.get()));
  }
}
