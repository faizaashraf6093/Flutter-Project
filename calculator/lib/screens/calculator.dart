import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator/controller/calculator_controller.dart';

import '../functions/theme.dart';
import '../widget/calculatorbtn.dart';
import '../widget/math_result.dart';

class Calculator extends StatelessWidget {
  Calculator({super.key});

  final calculatorCtrl = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Calculator',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              switchTheme(context);
            },
            icon: const Icon(Icons.light_mode_outlined),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              MathResult(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CalculatorButton(
                      text: 'AC',
                      bgColor: Colors.grey,
                      onPressed: () => calculatorCtrl.resetAll(),
                    ),
                  ),
                  Expanded(
                    child: CalculatorButton(
                      text: '+/-',
                      bgColor: Colors.grey,
                      onPressed: () => calculatorCtrl.changeSign(),
                    ),
                  ),
                  Expanded(
                    child: CalculatorButton(
                      text: 'del',
                      bgColor: Colors.grey,
                      onPressed: () => calculatorCtrl.delete(),
                    ),
                  ),
                  Expanded(
                    child: CalculatorButton(
                      text: '/',
                      bgColor: Colors.orangeAccent,
                      onPressed: () => calculatorCtrl.operationBtn('/'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CalculatorButton(
                      text: '7',
                      onPressed: () => calculatorCtrl.userInput('7'),
                    ),
                  ),
                  Expanded(
                    child: CalculatorButton(
                      text: '8',
                      onPressed: () => calculatorCtrl.userInput('8'),
                    ),
                  ),
                  Expanded(
                    child: CalculatorButton(
                      text: '9',
                      onPressed: () => calculatorCtrl.userInput('9'),
                    ),
                  ),
                  Expanded(
                    child: CalculatorButton(
                      text: 'x',
                      bgColor: Colors.orangeAccent,
                      onPressed: () => calculatorCtrl.operationBtn('x'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CalculatorButton(
                      text: '4',
                      onPressed: () => calculatorCtrl.userInput('4'),
                    ),
                  ),
                  Expanded(
                    child: CalculatorButton(
                      text: '5',
                      onPressed: () => calculatorCtrl.userInput('5'),
                    ),
                  ),
                  Expanded(
                    child: CalculatorButton(
                      text: '6',
                      onPressed: () => calculatorCtrl.userInput('6'),
                    ),
                  ),
                  Expanded(
                    child: CalculatorButton(
                      text: '-',
                      bgColor: Colors.orangeAccent,
                      onPressed: () => calculatorCtrl.operationBtn('-'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CalculatorButton(
                      text: '1',
                      onPressed: () => calculatorCtrl.userInput('1'),
                    ),
                  ),
                  Expanded(
                    child: CalculatorButton(
                      text: '2',
                      onPressed: () => calculatorCtrl.userInput('2'),
                    ),
                  ),
                  Expanded(
                    child: CalculatorButton(
                      text: '3',
                      onPressed: () => calculatorCtrl.userInput('3'),
                    ),
                  ),
                  Expanded(
                    child: CalculatorButton(
                      text: '+',
                      bgColor: Colors.orangeAccent,
                      onPressed: () => calculatorCtrl.operationBtn('+'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CalculatorButton(
                      text: '0',
                      big: true,
                      onPressed: () => calculatorCtrl.userInput('0'),
                    ),
                  ),
                  Expanded(
                    child: CalculatorButton(
                      text: '.',
                      onPressed: () => calculatorCtrl.decimalPoint(),
                    ),
                  ),
                  Expanded(child: Container()),
                  Expanded(
                    child: CalculatorButton(
                      text: '=',
                      bgColor: Colors.orangeAccent,
                      onPressed: () => calculatorCtrl.calculate(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
