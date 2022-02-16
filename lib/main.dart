import 'package:flutter/material.dart';
import 'package:round_six/theme.dart';
import 'package:round_six/widgets/logo.widget.dart';
import 'package:round_six/widgets/record.widget.dart';
import 'package:round_six/widgets/start_button.widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Round 6 Memory',
      debugShowCheckedModeBanner: false,
      theme: Round6Theme.theme,
      home: Scaffold(
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
                action: () {},
              ),
              StartButton(
                title: 'Modo Round 6',
                color: Round6Theme.color,
                action: () {},
              ),
              const SizedBox(height: 60),
              const Records()
            ],
          ),
        ),
      ),
    );
  }
}
