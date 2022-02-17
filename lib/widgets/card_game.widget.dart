import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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

class _CardGameState extends State<CardGame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color:
                widget.modo == Modo.normal ? Colors.white : Round6Theme.color,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: widget.modo == Modo.normal
                ? const AssetImage('assets/images/card_normal.png')
                : const AssetImage('assets/images/card_round.png'),
          )),
    );
  }
}
