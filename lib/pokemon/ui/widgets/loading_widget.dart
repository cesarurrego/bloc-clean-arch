import 'package:flutter/material.dart';

class PokemonLoading extends StatelessWidget {
  const PokemonLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.black,
      ),
    );
  }
}
