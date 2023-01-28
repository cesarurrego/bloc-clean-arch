import 'package:bloc_clean_arch/pokemon/bloc/pokemon_cubit.dart';
import 'package:core/api/api.abs.dart';
import 'package:core/api/api.dart';
import 'package:data/repositories/pokemon/pokemon_repository.dart';
import 'package:domain/use_cases/get_pokemon_uc.dart';
import 'package:injector/injector.dart';

class ServiceLocator {

  static final injector = Injector.appInstance;

  static T get<T extends Object>() {
    return injector.get();
  }

  Future<void> init() async {
    _initServices();
    _initRepositories();
    _initUseCases();
    _initBlocs();
  }

  void _initServices(){
    injector.registerSingleton<Api>(() => ApiImpl());
  }

  void _initRepositories() {
    injector.registerSingleton<PokemonRepository>(() => PokemonRepository(injector.get()));
  }

  void _initUseCases() {
    injector.register<GetPokemonUseCase>(CustomFactory(() => GetPokemonUseCaseImpl(injector.get())));
  }

  void _initBlocs(){
    injector.registerSingleton<PokemonCubit>(() => PokemonCubit(injector.get()));
  }
}

class CustomFactory<T> extends Factory<T> {
  CustomFactory(Builder<T> builder) : super(builder);

  @override
  T get instance {
    //Use this.builder to create your instance with custom logic.
    return builder();
  }
}
