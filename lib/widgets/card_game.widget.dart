import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:round_six/contants.dart';
import 'package:round_six/theme.dart';

class CardGame extends StatefulWidget {
  final Modo modo;
  final int opcao;

  const CardGame({
    Key? key,
    required this.modo,
    required this.opcao,
  }) : super(key: key);

  @override
  _CardGameState createState() => _CardGameState();
}

class _CardGameState extends State<CardGame>
    with SingleTickerProviderStateMixin {
  late AnimationController animation;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  flipCard() {
    if (!animation.isAnimating) {
      animation.forward();
      Timer(const Duration(seconds: 2), () => animation.reverse());
    }
  }

  AssetImage getImage(double angulo) {
    if (angulo > 0.5 * pi) {
      return AssetImage('assets/images/${widget.opcao.toString()}.png');
    } else {
      return widget.modo == Modo.normal
          ? const AssetImage('assets/images/card_normal.png')
          : const AssetImage('assets/images/card_round.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          final angulo = animation.value * pi;
          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateY(angulo);
          return GestureDetector(
            onTap: (() => flipCard()),
            child: Transform(
              alignment: Alignment.center,
              transform: transform,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: widget.modo == Modo.normal
                          ? Colors.white
                          : Round6Theme.color,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: getImage(angulo))),
              ),
            ),
          );
        });
  }
}
