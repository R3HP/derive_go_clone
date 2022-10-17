import 'package:deriv_go_clone/features/main/data/model/tick.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:fl_chart/src/chart/line_chart/line_chart_helper.dart';

class Chart extends StatefulWidget {
  final List<Tick> tickList;

  const Chart({Key? key, required this.tickList}) : super(key: key);
  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  LineChartMinMaxAxisValues? lineChartMinMaxAxisValues;

  @override
  void didUpdateWidget(covariant Chart oldWidget) {
    super.didUpdateWidget(oldWidget);

    final data = widget.tickList.map((e) => FlSpot(e.epoch, e.ask)).toList();
    final lineBar = LineChartBarData(spots: data);
    lineChartMinMaxAxisValues =
        LineChartHelper.calculateMaxAxisValues([lineBar]);
  }

  @override
  void initState() {
    super.initState();
    final data = widget.tickList.map((e) => FlSpot(e.epoch, e.ask)).toList();
    final lineBar = LineChartBarData(spots: data);
    lineChartMinMaxAxisValues =
        LineChartHelper.calculateMaxAxisValues([lineBar]);
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
          clipData: FlClipData.all(),
          minX: lineChartMinMaxAxisValues!.minX,
          maxX: lineChartMinMaxAxisValues!.maxX,
          lineTouchData:
              LineTouchData(handleBuiltInTouches: true, enabled: false),
          titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
                drawBehindEverything: true,
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
                drawBehindEverything: true,
              ),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
                isCurved: true,
                color: Colors.red,
                barWidth: 2,
                dotData: FlDotData(
                  show: false,
                ),
                spots: widget.tickList
                    .map((tick) => FlSpot(tick.epoch, tick.bid))
                    .toList())
          ]),
      swapAnimationDuration: const Duration(milliseconds: 200),
    );
  }
}
