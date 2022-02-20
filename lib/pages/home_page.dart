import 'package:flutter/material.dart';
import 'package:round_six/contants.dart';
import 'package:round_six/pages/nivel_page.dart';
import 'package:round_six/theme.dart';
import 'package:round_six/widgets/logo.widget.dart';
import 'package:round_six/widgets/record.widget.dart';
import 'package:round_six/widgets/start_button.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo(),
            StartButton(
              title: 'Modo Normal',
              color: Colors.white,
              action: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const NivelPage(
                        modo: Modo.normal,
                      )),
                ),
              ),
            ),
            StartButton(
              title: 'Modo Round 6',
              color: Round6Theme.color,
              action: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const NivelPage(
                        modo: Modo.round6,
                      )),
                ),
              ),
            ),
            const SizedBox(height: 60),
            const Records()
          ],
        ),
      ),
    );
  }
}
