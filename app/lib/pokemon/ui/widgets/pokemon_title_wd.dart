import 'package:bloc_clean_arch/utils/string_extension.dart';
import 'package:flutter/material.dart';

class PokemonNameWidget extends StatelessWidget {
  final String name;
  final int id;
  final double size;

  const PokemonNameWidget({
    Key? key,
    required this.id,
    required this.name,
    this.size = 18.0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${name.toCapitalize()} ',
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '#$id',
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.5),
          ),
        )
      ],
    );
  }
}
