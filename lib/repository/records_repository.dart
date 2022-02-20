import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:round_six/contants.dart';
import 'package:round_six/models/game_play.dart';

part 'records_repository.g.dart';

class RecordsRepository = RecordsRepositoryBase with _$RecordsRepository;

abstract class RecordsRepositoryBase with Store {
  late final Box _records;
  late final GamePlay gamePlay;

  @observable
  Map recordsRound6 = {};

  @observable
  Map recordsNormal = {};

  RecordsRepositoryBase() {
    _initRepository();
  }

  _initRepository() async {
    await _initDatabase();
    await loadRecords();
  }

  _initDatabase() async {
    _records = await Hive.openBox('gameRecords');
  }

  @action
  loadRecords() {
    recordsNormal = _records.get(Modo.normal.toString()) ?? {};
    recordsRound6 = _records.get(Modo.round6.toString()) ?? {};
  }

  updateRecords({required GamePlay gamePlay, required int score}) {
    final key = gamePlay.modo.toString();

    if (gamePlay.modo == Modo.normal &&
        (recordsNormal[gamePlay.nivel] == null ||
            score < recordsNormal[gamePlay.nivel])) {
      recordsNormal[gamePlay.nivel] = score;
      _records.put(key, recordsNormal);
    } else if (gamePlay.modo == Modo.round6 &&
        (recordsRound6[gamePlay.nivel] == null ||
            score > recordsRound6[gamePlay.nivel])) {
      recordsRound6[gamePlay.nivel] = score;
      _records.put(key, recordsRound6);
    }
  }
}
