import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:round_six/contants.dart';
import 'package:round_six/repository/records_repository.dart';
import 'package:round_six/theme.dart';

class RecordsPages extends StatelessWidget {
  final Modo modo;
  // final List<String> recs = ['Modo', 'Nível 8', 'Nível 10', 'Nível 12'];

  const RecordsPages({Key? key, required this.modo}) : super(key: key);

  getModo() {
    return modo == Modo.normal ? 'Normal' : 'Round 6';
  }

  List<Widget> getRecordsList(Map records) {
    final List<Widget> widgets = [];

    records.forEach((nivel, score) {
      widgets.add(ListTile(
        title: Text('Nível $nivel'),
        trailing: Text(score.toString()),
        tileColor: Colors.grey[900],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ));
      widgets.add(
        (const Divider(
          color: Colors.transparent,
        )),
      );
    });

    if (widgets.isEmpty) {
      widgets.add(const Center(
        child: Text('Sem records!'),
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<RecordsRepository>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recordes'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(12),
          child: Observer(
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 36, bottom: 24),
                    child: Center(
                      child: Text(
                        'Modo ${getModo()}',
                        style: const TextStyle(
                            fontSize: 28, color: Round6Theme.color),
                      ),
                    ),
                  ),
                  ...getRecordsList(modo == Modo.normal
                      ? repository.recordsNormal
                      : repository.recordsRound6),
                ],
              );
            },
          )),
    );
  }
}
