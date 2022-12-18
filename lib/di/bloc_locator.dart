import 'package:bloc_clean_arch/di/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:bloc_clean_arch/pokemon/bloc/pokemon_cubit.dart';

class BlocLocator {
  static List<BlocProviderSingleChildWidget> initBlocProviders() {
    return [
      BlocProvider(
        create: (context) => PokemonCubit(ServiceLocator.get()),
      ),
    ];
  }
}
