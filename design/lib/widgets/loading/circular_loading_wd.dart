import 'package:flutter/material.dart';

class PokeBallLoading extends StatefulWidget {
  final double scale;

  const PokeBallLoading({
    Key? key,
    this.scale = 15.0,
  }) : super(key: key);

  @override
  State<PokeBallLoading> createState() => _PokeBallLoadingState();
}

class _PokeBallLoadingState extends State<PokeBallLoading> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const imageUrl = 'assets/core/pokeball.png';
    return Center(
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
        child: Image.asset(
          imageUrl,
          scale: widget.scale,
        ),
      ),
    );
  }
}
