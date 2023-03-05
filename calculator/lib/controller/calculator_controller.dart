import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var firstNum = '1'.obs;
  var secNum = '2'.obs;
  var result = '3'.obs;
  var operation = ''.obs;

  resetAll() {
    firstNum.value = '0';
    secNum.value = '0';
    result.value = '0';
    operation.value = '';
  }

  changeSign() {
    if (result.value.startsWith("-")) {
      result.value = result.value.replaceFirst("-", "");
    } else {
      result.value = '-' "${result.value}";
    }
  }

  userInput(String number) {
    if (result.value == '0') {
      return result.value = number;
    }

    if (result.value == '-0') {
      return result.value = '-' '$number';
    }

    result.value = result.value + number;
  }

  decimalPoint() {
    if (result.value.contains('.')) return;

    if (result.value.startsWith('0')) {
      return result.value = '0.';
    } else {
      return result.value = '${result.value}' '.';
    }
  }

  operationBtn(String newOperation) {
    operation.value = newOperation;
    firstNum.value = result.value;
    result.value = '0';
  }

  delete() {
    if (result.value.replaceAll('-', '').length > 1) {
      result.value = result.value.substring(0, result.value.length - 1);
    } else {
      result.value = '0';
    }
  }

  calculate() {
    double num1 = double.parse(firstNum.value);
    double num2 = double.parse(result.value);

    secNum.value = result.value;

    switch (operation.value) {
      case "+":
        result.value = "${num1 + num2}";
        break;

      case "-":
        result.value = "${num1 - num2}";
        break;

      case "/":
        result.value = "${num2 / num1}";
        break;

      case "x":
        result.value = "${num1 * num2}";
        break;

      default:
        return;
    }

    
    if (result.value.endsWith('.0')) {
      result.value = result.value.substring(0, result.value.length - 2);
    }
  }
}
