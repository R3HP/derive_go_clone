// import 'package:bezier_chart/bezier_chart.dart';
// import 'package:flutter/material.dart';

// import 'package:deriv_go_clone/features/main/data/model/tick.dart';

// class LinearChart extends StatelessWidget {
//   final List<Tick> tickList;

//   const LinearChart({
//     Key? key,
//     required this.tickList,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BezierChart(
//       config: BezierChartConfig(
//         backgroundColor: Colors.black,
//       ),
//       bezierChartScale: BezierChartScale.CUSTOM,
//       // bezierChartScale: BezierChartScale.HOURLY,
//       // fromDate: DateTime.now().subtract(Duration(days: 1)),
//       // toDate: DateTime.now(),
//       // xAxisCustomValues: tickList.map((t) => t.createdAt.second.toDouble()).toList(),
//       // xAxisCustomValues: tickList.map((tick) => tick.epoch.remainder(1000 * tick.epoch.toStringAsFixed(0).length)).toList(),
//       xAxisCustomValues: tickList.map((tick) => tick.epoch - tickList.first.epoch).toList(),
//       series: [
//         BezierLine(
//           data: tickList.map((tick) => DataPoint(value: tick.bid,xAxis: tick.epoch)).toList(),
//           // data: [
//           //   DataPoint(value: 5, xAxis: 2),
//           //   DataPoint(value: 8, xAxis: 6),
//           //   DataPoint(value: 4, xAxis: 7),
//           //   DataPoint(value: 2, xAxis: 8),
//           //   DataPoint(value: 5, xAxis: 12),
//           // ],
          
//           lineColor: Colors.red
//         )
//       ],
      
//     );
//   }
// }
