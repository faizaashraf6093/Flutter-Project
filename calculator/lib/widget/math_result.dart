import 'package:calculator/controller/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'line.dart';
import 'main_result.dart';
import 'sub_result.dart';

class MathResult extends StatelessWidget {
  final calculatorCtrl = Get.find<CalculatorController>();

  MathResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          SubResult(text: '${calculatorCtrl.firstNum}'),
          SubResult(text: '${calculatorCtrl.operation}'),
          SubResult(text: '${calculatorCtrl.secNum}'),
          const LineSeparator(),
          MainResult(text: '${calculatorCtrl.result}'),
        ],
      ),
    );
  }
}
