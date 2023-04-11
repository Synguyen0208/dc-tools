import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key, required this.controller});

  final ScrollController controller;

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> {
  get offset => widget.controller.hasClients ? widget.controller.offset : 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (BuildContext context, Widget? child) {
        return OverflowBox(
          maxWidth: double.infinity,
          alignment: const Alignment(4, 3),
          child: Transform.rotate(
            angle: ((math.pi * offset) / -1024),
            child: const Icon(Icons.settings, size: 512, color: Colors.white),
          ),
        );
      },
    );
  }
}
