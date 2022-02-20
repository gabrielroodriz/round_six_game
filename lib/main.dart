import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:round_six/controllers/game_controller.dart';
import 'package:round_six/pages/home_page.dart';
import 'package:round_six/repository/records_repository.dart';
import 'package:round_six/theme.dart';

void main() async {
  await Hive.initFlutter();

  runApp(MultiProvider(
    providers: [
      Provider<RecordsRepository>(create: (_) => RecordsRepository()),
      ProxyProvider<RecordsRepository, GameController>(
        update: (_, repo, __) => GameController(recordsRepository: repo),
      ),
    ],
    child: const MyApp(),
  ));
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
