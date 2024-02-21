import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:provider/provider.dart';
import 'package:test_range/features/test_range/presenatation/controllers/test_home_controller.dart';

import '../../../../global/design_system/colors/colors.dart';
import '../../../../global/design_system/sizing/sizing.dart';

class TestInputField extends StatelessWidget {
  const TestInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<TestHomeController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sp.px20),
      child: Obx(() {
        final errorMsg = controller.validationMsg.value;
        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(Sp.px20),
                child: TextField(
                  controller: controller.textInputController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '0',
                    labelText: 'Enter Test Score',
                    errorText: errorMsg,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Rounding.px20),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Rounding.px20),
                      borderSide: const BorderSide(color: Indra.blue),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Rounding.px20),
                      borderSide: const BorderSide(color: Indra.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Rounding.px20),
                      borderSide: const BorderSide(color: Indra.red),
                    ),
                  ),
                  onChanged: (score) => _onChanged(score, controller),
                ),
              ),
            ),
            IconButton(
              onPressed: controller.updateSearchedScore,
              icon: const Icon(Icons.arrow_circle_right),
            )
          ],
        );
      }),
    );
  }

  void _onChanged(String value, TestHomeController controller) {
    if (value.trim().isEmpty) {
      controller.updateValidationMsg('Please enter a number');
    }
    int score = int.tryParse(value) ?? 0;
    if (score < 0) {
      controller.updateValidationMsg('Test Score must be >= 0');
    } else {
      controller.updateValidationMsg(null);
    }
  }
}
