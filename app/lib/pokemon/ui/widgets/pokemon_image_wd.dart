import 'package:cached_network_image/cached_network_image.dart';
import 'package:design/widgets/loading/circular_loading_wd.dart';
import 'package:flutter/material.dart';

class PokemonImageWidget extends StatelessWidget {
  final String imageUrl;
  final double width;

  const PokemonImageWidget({
    Key? key,
    required this.imageUrl,
    this.width = 80.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      key: UniqueKey(),
      tag: imageUrl,
      child: CachedNetworkImage(
        progressIndicatorBuilder: (_, __, ___) {
          return const PokeBallLoading(scale: 18.0);
        },
        imageUrl: imageUrl,
        width: width,
      ),
    );
  }
}
