import 'package:deriv_go_clone/features/main/presentation/widgets/custom_line_chart_painter.dart';
import 'package:flutter/material.dart';

import 'package:deriv_go_clone/features/main/data/model/tick.dart';

class CustomLineChart extends StatefulWidget {
  final List<Tick> ticks;

  const CustomLineChart({
    Key? key,
    required this.ticks,
  }) : super(key: key);

  @override
  State<CustomLineChart> createState() => _CustomLineChartState();
}

class _CustomLineChartState extends State<CustomLineChart> {
  late double _maxY;
  late double _minY;
  late double _maxX;
  late double _minX;

  @override
  void initState() {
    super.initState();
    determineMaxAndMin();
  }

  @override
  void didUpdateWidget(covariant CustomLineChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    determineMaxAndMin();
  }

  void determineMaxAndMin() {
    double maxY = -double.maxFinite;
    double minY = double.maxFinite;
    double maxX = -double.maxFinite;
    double minX = double.maxFinite;

    for (var tick in widget.ticks) {
      maxY = tick.ask > maxY ? tick.ask : maxY;
      minY = minY > tick.ask ? tick.ask : minY;
      maxX = tick.epoch > maxX ? tick.epoch : maxX;
      minX = minX > tick.epoch ? tick.epoch : minX;
    }
    _maxX = maxX;
    _minX = minX;
    _maxY = maxY;
    _minY = minY;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: CustomPaint(
        painter: CustomLineChartPainter(
            tickList: widget.ticks,
            maxX: _maxX,
            minX: _minX,
            maxY: _maxY,
            minY: _minY
            ),
        child: Container(),
      ),
    );
  }
}

