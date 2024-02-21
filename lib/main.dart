import 'package:flutter/material.dart';

import 'core/injection/injection.dart';
import 'features/test_range/presenatation/screens/test_home_page.dart';

void main() => runApp(const TestRange());

class TestRange extends StatefulWidget {
  const TestRange({super.key});

  @override
  State<TestRange> createState() => _TestRangeState();
}

class _TestRangeState extends State<TestRange> {
  @override
  void initState() {
    registerOnAppStartUpServices();
    super.initState();
  }

  @override
  void dispose() {
    unRegisterOnAppClosedServices();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      const MaterialApp(debugShowCheckedModeBanner: false, home: TestHome());
}
