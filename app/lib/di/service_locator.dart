import 'package:bloc_clean_arch/pokemon/bloc/pokemon_cubit.dart';
import 'package:core/api/api.abs.dart';
import 'package:core/api/api.dart';
import 'package:data/repositories/pokemon/pokemon_repository.dart';
import 'package:domain/use_cases/get_pokemon_uc.dart';
import 'package:kiwi/kiwi.dart';

class ServiceLocator {

  static final container = KiwiContainer();

  static T get<T extends Object>() {
    return container.resolve();
  }

  Future<void> init() async {
    _initServices();
    _initRepositories();
    _initUseCases();
    _initBlocs();
  }

  void _initServices(){
    container.registerSingleton<Api>((_) => ApiImpl());
  }

  void _initRepositories() {
    container.registerSingleton<PokemonRepository>((_) => PokemonRepository(container.resolve()));
  }

  void _initUseCases() {
    container.registerInstance<GetPokemonUseCase>(GetPokemonUseCaseImpl(container.resolve()));
  }

  void _initBlocs(){
    container.registerSingleton<PokemonCubit>((_) => PokemonCubit(container.resolve()));
  }
}