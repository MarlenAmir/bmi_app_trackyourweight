import 'dart:math';

class calculatorBrain{

  calculatorBrain({required this.height, required this.weight});

  final int? height;
  final int? weight;

  double _bmi = 0;


  String CalculateBMI(){
    double _bmi = weight!/ pow(height! / 100 , 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if (_bmi>=25){
      return 'Overweight';
    }
    else if(_bmi>18.5){
      return 'Normal';
    }
    else {
      return 'UnderWeight';
    }

  }
  String getInterpretation(){
    if (_bmi>=25){
      return 'You need to lose weight. Go to gym!';
    }
    else if(_bmi>18.5 && _bmi>=25){
    return 'Normal Body Weight! ';
    }
    else {
      return 'Keep going!';
    }

  }
}