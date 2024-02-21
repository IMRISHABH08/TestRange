import 'package:equatable/equatable.dart';

import 'single_test.dart';

class TestResultData extends Equatable {
  const TestResultData(
      {required this.maxRange, required this.tests, this.minRange = 0});

  final int maxRange;
  final int minRange;
  final List<Test> tests;

  @override
  List<Object?> get props => [maxRange];
}
