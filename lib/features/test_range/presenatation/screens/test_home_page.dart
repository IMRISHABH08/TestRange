import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:test_range/features/test_range/presenatation/controllers/test_home_controller.dart';

import '../../../../global/design_system/colors/colors.dart';
import '../../../../global/design_system/sizing/sizing.dart';
import 'input_field.dart';
import 'range_bar.dart';

class TestHome extends StatelessWidget {
  const TestHome({super.key});

  @override
  Widget build(BuildContext context) {
    return InheritedProvider(
      create: (context) => TestHomeController(usecase: GetIt.I.get()),
      dispose: (context, _) => _.dispose(),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Indra.white,
          body: Padding(
            padding: const EdgeInsets.all(Sp.px12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                TestRangeBar(),
                SizedBox(height: Sp.px80),
                TestInputField(),
              ],
            ),
          ),
        );
      },
    );
  }
}
