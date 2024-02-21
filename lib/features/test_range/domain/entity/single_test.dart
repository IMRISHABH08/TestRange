import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../global/design_system/colors/colors.dart';

class Test extends Equatable {
  const Test({
    required this.maxRange,
    required this.minRange,
    required this.resultType,
  });

  final int minRange;
  final int maxRange;
  final TestResult resultType;

  @override
  List<Object?> get props => [resultType];
}

enum TestResult {
  ideal,
  moderate,
  dangerous;

  Color get bgColor {
    if (this == moderate) return Indra.orange;
    if (this == dangerous) return Indra.red;
    return Indra.green;
  }
}
