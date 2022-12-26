import 'package:bloc_clean_arch/pokemon/bloc/pokemon_cubit.dart';
import 'package:core/api/api.abs.dart';
import 'package:core/api/api.dart';
import 'package:data/repositories/pokemon/pokemon_repository.dart';
import 'package:domain/use_cases/get_pokemon_info_uc.dart';
import 'package:domain/use_cases/get_pokemon_list_uc.dart';
import 'package:domain/use_cases/get_pokemon_uc.dart';
import 'package:get_it/get_it.dart';

class ServiceLocator {

  static final _getIt = GetIt.instance;

  static T get<T extends Object>() {
    return _getIt.get();
  }

  Future<void> init() async {
    _initServices();
    _initRepositories();
    _initUseCases();
    _initBlocs();
  }

  void _initServices(){
    _getIt.registerLazySingleton<Api>(() => ApiImpl());
  }

  void _initRepositories() {
    _getIt.registerLazySingleton<PokemonRepository>(() => PokemonRepository(_getIt.get()));
  }

  void _initUseCases() {
    _getIt.registerFactory<GetPokemonListUseCase>(() => GetPokemonListUseCaseImpl(_getIt.get()));
    _getIt.registerFactory<GetPokemonInfoUseCase>(() => GetPokemonInfoUseCaseImpl(_getIt.get()));
    _getIt.registerFactory<GetPokemonUseCase>(() => GetPokemonUseCaseImpl(_getIt.get(), _getIt.get()));
  }

  void _initBlocs(){
    _getIt.registerLazySingleton<PokemonCubit>(() => PokemonCubit(_getIt.get()));

  }
}
