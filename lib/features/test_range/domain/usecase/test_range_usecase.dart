import 'package:test_range/features/test_range/domain/entity/test_metadata.dart';

import '../entity/single_test.dart';

abstract class TestRangeUsecase {
  TestResultData? getResultMetaData();
}

class TestRangeUsecaseImpl implements TestRangeUsecase {
  static const minRange = 0;
  int maxRange = 120;

  @override
  TestResultData? getResultMetaData() {
    final testTypes = [
      const Test(
          minRange: minRange, maxRange: 30, resultType: TestResult.dangerous),
      const Test(minRange: 30, maxRange: 40, resultType: TestResult.moderate),
      const Test(minRange: 40, maxRange: 60, resultType: TestResult.ideal),
      const Test(minRange: 60, maxRange: 70, resultType: TestResult.moderate),
      Test(minRange: 70, maxRange: maxRange, resultType: TestResult.dangerous),
    ];
    return TestResultData(maxRange: 120, tests: testTypes);
  }
}
