import 'package:design/widgets/loading/circular_loading_wd.dart';
import 'package:flutter/material.dart';

class PokemonImageWidget extends StatelessWidget {
  final String imageUrl;
  final double scale;

  const PokemonImageWidget({
    Key? key,
    required this.imageUrl,
    this.scale = 6.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      key: UniqueKey(),
      tag: imageUrl,
      child: Image.network(
        imageUrl,
        scale: scale,
        loadingBuilder: (_, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress != null) {
            return const PokeBallLoading(scale: 18.0);
          }
          return child;
        },
      ),
    );
  }
}
