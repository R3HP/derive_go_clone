import 'package:deriv_go_clone/features/main/data/model/tick.dart';
import 'package:deriv_go_clone/features/main/presentation/widgets/custom_line_chart.dart';
import 'package:flutter/material.dart';


class TestScreen extends StatelessWidget {
  const TestScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomLineChart(ticks: [
        Tick(msgType: '', id: '', ask: 5, bid: 0, epoch: 2, pipSize: '', quote: 0, symbol: '', createdAt: DateTime.now()),
        Tick(msgType: '', id: '', ask: 3, bid: 0, epoch: 4, pipSize: '', quote: 0, symbol: '', createdAt: DateTime.now()),
        Tick(msgType: '', id: '', ask: 7, bid: 0, epoch: 6, pipSize: '', quote: 0, symbol: '', createdAt: DateTime.now()),
        Tick(msgType: '', id: '', ask: 10, bid: 0, epoch:8, pipSize: '', quote: 0, symbol: '', createdAt: DateTime.now()),
        Tick(msgType: '', id: '', ask: 6, bid: 0, epoch:10, pipSize: '', quote: 0, symbol: '', createdAt: DateTime.now()),
        Tick(msgType: '', id: '', ask: 1, bid: 0, epoch:12, pipSize: '', quote: 0, symbol: '', createdAt: DateTime.now()),
      ]),
    );
  }
}