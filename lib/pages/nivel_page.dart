import 'package:flutter/material.dart';
import 'package:round_six/contants.dart';
import 'package:round_six/widgets/card_nivel.widget.dart';

class NivelPage extends StatelessWidget {
  final Modo modo;
  const NivelPage({Key? key, required this.modo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nível do Jogo"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: const EdgeInsets.all(24),
          children: [
            CardNivel(modo: modo, nivel: 6),
            CardNivel(modo: modo, nivel: 8),
            CardNivel(modo: modo, nivel: 12),
            CardNivel(modo: modo, nivel: 16),
            CardNivel(modo: modo, nivel: 18),
          ],
        ),
      ),
    );
  }
}
