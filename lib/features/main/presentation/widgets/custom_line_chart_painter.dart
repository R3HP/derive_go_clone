import 'package:flutter/material.dart';

import 'package:deriv_go_clone/features/main/data/model/tick.dart';

class CustomLineChartPainter extends CustomPainter {
  final List<Tick> tickList;
  final double maxY;
  final double minY;
  final double maxX;
  final double minX;

  CustomLineChartPainter({
    required this.tickList,
    required this.maxY,
    required this.minY,
    required this.maxX,
    required this.minX,
  });

  static double border = 10.0;

  @override
  void paint(Canvas canvas, Size size) {
    final drawableHeight = size.height - 3.0 * border;
    final drawableWidth = size.width - 3.0 * border;

    final hd = drawableHeight / 5.0;
    final wd = drawableWidth / tickList.length.toDouble();

    final height = hd * 3.0;
    final width = drawableWidth;
    if (height <= 0.0 || width <= 0.0) return;
    if (maxY - minY < 1.0e-6) return;
    final hr = height / (maxY - minY);

    final left = border;
    final top = border;
    var c = Offset(left + wd / 2.0, top + height / 2.0);
    _drawOutline(canvas, c, wd, height);

    final points = _calculatePoints(c, wd, height, hr);
    final path = _calculatePath(points);
    final yLabels = _calculateYLabels();
    final xLabels = _calculateXLabels();
    drawDataPoints(points, canvas);
    drawLineToDataPoints(canvas, path);
    drawYLabels(yLabels, points, top, c, canvas, wd);
    drawXLabels(xLabels, c, hd, canvas, wd);
  }

  void drawXLabels(
      List<String> xLabels, Offset c, double hd, Canvas canvas, double wd) {
    for (var xLabel in xLabels) {
      var c1 = c + Offset(0, 4 * hd);
      drawTextCentered(canvas, c1, xLabel, wd);
      c += Offset(wd, 0);
    }
  }

  void drawLineToDataPoints(Canvas canvas, Path path) {
    canvas.drawPath(
        path,
        Paint()
          ..color = Colors.cyan
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.0);
  }

  void drawYLabels(List<String> labels, List<Offset> points, double top,
      Offset c, Canvas canvas, double wd) {
    for (var i = 0; i < labels.length; i++) {
      final label = labels[i];
      final point = points[i];
      final dataPointLabelOffset = Offset(0, point.dy - 15 < top ? 15 : -15);
      c = point + dataPointLabelOffset;
      drawTextCentered(canvas, c, label, wd);
      c += Offset(wd, 0);
    }
  }

  void drawDataPoints(List<Offset> points, Canvas canvas) {
    for (var point in points) {
      canvas.drawCircle(point, 5, Paint()..color = Colors.deepPurple);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _drawOutline(Canvas canvas, Offset c, double wd, double height) {
    debugPrint(tickList.length.toString());
    for (var element in tickList) {
      final rect = Rect.fromCenter(center: c, width: wd, height: height);
      canvas.drawRect(
          rect,
          Paint()
            ..color = Colors.red
            ..strokeWidth = 1.0
            ..style = PaintingStyle.stroke);
      c += Offset(wd, 0);
    }
  }

  List<Offset> _calculatePoints(Offset c, double wd, double height, double hr) {
    debugPrint('hr : $hr');
    debugPrint('max : $maxY');
    debugPrint('min : $minY');
    final List<Offset> points = [];
    for (var tick in tickList) {
      final pY = (height - (tick.ask - minY) * hr) * -1;

      final cP = Offset(c.dx, c.dy - height / 2.0 - pY);
      points.add(cP);
      c += Offset(wd, 0);
    }
    return points;
  }

  Path _calculatePath(List<Offset> points) {
    final path = Path();
    for (var point in points) {
      if (point == points.first) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }

    return path;
  }

  List<String> _calculateYLabels() {
    final List<String> labels = [];
    for (var element in tickList) {
      final label = element.ask;
      labels.add(label.toStringAsFixed(0));
    }

    return labels;
  }

  List<String> _calculateXLabels() {
    final List<String> labels = [];
    for (var element in tickList) {
      final label = element.epoch;
      labels.add(label.toStringAsFixed(0));
    }

    return labels;
  }

  void drawTextCentered(Canvas canvas, Offset c, String label, double wd) {
    final tp = measeureText(
        label,
        wd,
        TextAlign.center,
        const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600));
    final pos = c + Offset(-tp.width / 2.0, -tp.height / 2.0);
    tp.paint(canvas, pos);
  }

  TextPainter measeureText(
      String label, double wd, TextAlign align, TextStyle textStyle) {
    final span = TextSpan(
      style: textStyle,
      text: label,
    );
    final tp = TextPainter(
        text: span, textAlign: align, textDirection: TextDirection.ltr);
    tp.layout(minWidth: 0, maxWidth: wd);
    return tp;
  }
}
