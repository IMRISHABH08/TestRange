import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:provider/provider.dart';
import 'package:test_range/features/test_range/domain/entity/test_metadata.dart';
import 'package:test_range/features/test_range/presenatation/controllers/test_home_controller.dart';

import '../../../../global/design_system/colors/colors.dart';
import '../../domain/entity/single_test.dart';

class TestRangeBar extends StatelessWidget {
  const TestRangeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final controller = context.read<TestHomeController>();
      var searchedValue = controller.searchedScore.value;
      var testMetadata = controller.testMetadata.value;

      return LayoutBuilder(
        builder: (context, constraints) {
          return CustomPaint(
            willChange: true,
            painter: NumberHighlightPainter(
              highlightedNumber: searchedValue,
              testMetaData: testMetadata,
            ),
            child: SizedBox(width: constraints.maxWidth, height: 75),
          );
        },
      );
    });
  }
}

class NumberHighlightPainter extends CustomPainter {
  final int highlightedNumber;
  final TestResultData testMetaData;

  NumberHighlightPainter(
      {required this.highlightedNumber, required this.testMetaData});

  @override
  void paint(Canvas canvas, Size size) {
    const textStyle = TextStyle(
        color: Indra.black, fontSize: 12, fontWeight: FontWeight.w500);

    final double widthPerUnitRange = (size.width - 10) / testMetaData.maxRange;

    for (final test in testMetaData.tests) {
      final double startRange = widthPerUnitRange * test.minRange;
      final double endRange = widthPerUnitRange * test.maxRange;

      const double barHeight = 20;
      final double barWidth = (endRange - startRange);

      // DRAW RANGE-BAR
      final paint = Paint()
        ..color = test.resultType.bgColor
        ..strokeWidth = 2.0
        ..style = PaintingStyle.fill;
      canvas.drawRect(
          Rect.fromLTWH(startRange, 30, barWidth, barHeight), paint);

      // DRAW MIN VALUE
      if (drawRangeValue(test)) {
        TextPainter(
          text: TextSpan(text: '${test.minRange}', style: textStyle),
          textDirection: TextDirection.ltr,
        )
          ..layout()
          ..paint(canvas, Offset(startRange, barHeight + 35));
      }

      // DRAW MAX VALUE
      if (drawRangeValue(test)) {
        TextPainter(
          text: TextSpan(text: '${test.maxRange}', style: textStyle),
          textDirection: TextDirection.ltr,
        )
          ..layout()
          ..paint(canvas, Offset(endRange - 10, 15));
      }
    }

    // DRAW SEARCHED VALUE
    if (highlightedNumber >= 0 && highlightedNumber <= 120) {
      const dy = 30.0;
      final dx =
          (widthPerUnitRange * highlightedNumber) + (widthPerUnitRange / 4);

      final numberPainter = TextPainter(
        text: TextSpan(
            text: '$highlightedNumber',
            style: textStyle.copyWith(fontWeight: FontWeight.bold)),
        textDirection: TextDirection.ltr,
      );
      numberPainter.layout();
      final double numberWidth = numberPainter.width;

      // DRAW LINE POINTING TO RANGE BAR
      final Paint linePaint = Paint()
        ..color = Colors.black
        ..strokeWidth = 1.0;
      canvas.drawLine(Offset(dx, dy), Offset(dx, 15), linePaint);

      // DRAW SEARCHED SCORE
      numberPainter.paint(canvas, Offset(dx - numberWidth / 2, 0));
    }
  }

  int getIndex(Test test) => testMetaData.tests.indexOf(test);

  bool drawRangeValue(Test test) => getIndex(test).isEven;

  @override
  bool shouldRepaint(covariant NumberHighlightPainter oldDelegate) {
    return highlightedNumber != oldDelegate.highlightedNumber;
  }
}
