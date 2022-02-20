import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:round_six/contants.dart';
import 'package:round_six/controllers/game_controller.dart';
import 'package:round_six/models/game_play.dart';
import 'package:round_six/pages/game_page.dart';
import 'package:round_six/theme.dart';

class CardNivel extends StatelessWidget {
  GamePlay gamePlay;

  CardNivel({
    Key? key,
    required this.gamePlay,
  }) : super(key: key);

  startGame(BuildContext context) {
    context.read<GameController>().startGame(gamePlay: gamePlay);
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => GamePage(gamePlay: gamePlay)));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => startGame(context)),
      borderRadius: const BorderRadius.all(
        Radius.circular(10.0),
      ),
      child: Container(
        width: 90,
        height: 90,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                gamePlay.modo == Modo.normal ? Colors.white : Round6Theme.color,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color: gamePlay.modo == Modo.normal
              ? Colors.transparent
              : Round6Theme.color.withOpacity(.6),
        ),
        child: Center(
          child: Text(
            gamePlay.nivel.toString(),
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
