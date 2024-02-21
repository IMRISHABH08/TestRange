import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entity/test_metadata.dart';
import '../../domain/usecase/test_range_usecase.dart';

class TestHomeController {
  TestHomeController({required TestRangeUsecase usecase}) : _usecase = usecase {
    _init();
  }

  static const noOfDivisions = 10;

  final TestRangeUsecase _usecase;

  final searchedScore = 0.obs;

  final validationMsg = Rxn<String>();

  final testMetadata = const TestResultData(maxRange: 100, tests: []).obs;

  final textInputController = TextEditingController();

  void _init() {
    getTestMetadata();
  }

  void getTestMetadata() {
    final metaData = _usecase.getResultMetaData();
    if (metaData != null) testMetadata(metaData);
  }

  void updateValidationMsg(String? msg) => validationMsg.value = msg;

  void updateSearchedScore() {
    final score = int.tryParse(textInputController.text.trim()) ?? 0;
    searchedScore.value = score;
  }

  void dispose() {
    testMetadata.close();
    validationMsg.close();
  }
}
