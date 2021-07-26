import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight,});
  final int height;
  final int weight;
  double _bmi;

String calculateBMI(){
  _bmi=weight/pow(height/100, 2);
  return _bmi.toStringAsFixed(2);
}

  String getResult() {
    if (_bmi >= 25) {
      return "Over Weight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Under Weight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "You Have a Higher Than Normal Body Weight. Try To Exercise  More";
    } else if (_bmi > 18.5) {
      return " Perfect . You Have A Normal Body Weight . Good job";
    } else {
      return "You Have a Lower Than Normal Body Weight. You Should Eat More And More";
    }
  }

}
