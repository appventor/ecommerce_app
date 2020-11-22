import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

import 'nextButton.dart';

class IndicatorButton extends StatelessWidget {
  final double angle;
  final int pages;
  final PageController pageController;
  final VoidCallback onPressed;

  const IndicatorButton({
    @required this.angle,
    @required this.pages,
    @required this.pageController,
    this.onPressed,
  })  : assert(angle != null),
        assert(pageController != null),
        assert(pages != null);

  @override
  Widget build(BuildContext context) {
    List<SingleChildWidget> myWidgets = List.generate(pages + 1, (index) {
      return index == pages
          ? NextButton(pageController: pageController, onPressed: onPressed)
          : ArcIndicators(
              selected: pageController.page == null
                  ? false
                  : pageController.page.round() + 1 > index
                      ? true
                      : false,
              angle: 1.05 * pi + index * 1.56 + angle,
            );
    });
    return Nested(children: myWidgets);
  }
}

class ArcIndicators extends SingleChildStatelessWidget {
  final bool selected;
  final double angle;
  ArcIndicators({Key key, this.selected, this.angle, Widget child})
      : super(key: key, child: child);

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    return CustomPaint(
        painter: _ArcIndicatorPainter(
            color: selected ? Colors.white : Colors.white.withOpacity(0.25),
            indicatorLength: 2 * pi / 5,
            startAngle: angle),
        child: child);
  }
}

class _ArcIndicatorPainter extends CustomPainter {
  final Color color;
  final double startAngle;
  final double indicatorLength;

  const _ArcIndicatorPainter({
    @required this.color,
    @required this.startAngle,
    @required this.indicatorLength,
  })  : assert(color != null),
        assert(startAngle != null),
        assert(indicatorLength != null);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: (size.shortestSide + 12.0) / 2,
      ),
      startAngle,
      indicatorLength,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_ArcIndicatorPainter oldDelegate) {
    return this.color != oldDelegate.color ||
        this.startAngle != oldDelegate.startAngle;
  }
}
