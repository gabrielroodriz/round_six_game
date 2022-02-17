import 'package:flutter/material.dart';
import 'package:round_six/contants.dart';
import 'package:round_six/pages/home_page.dart';
import 'package:round_six/pages/nivel_page.dart';
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
        home: const HomePage());
  }
}
