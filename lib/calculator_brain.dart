class CalculatorBrain {
  final int height;
  final int weight;
  CalculatorBrain({this.height, this.weight});

  String getBMI() {
    return (weight / (height * height * .0001)).toStringAsFixed(1);
  }

  String getResult() {
    double bmi = double.parse(getBMI());
    if (bmi >= 25)
      return 'Overweight';
    else if (bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getInterpretation() {
    double bmi = double.parse(getBMI());
    if (bmi >= 25)
      return 'You have a higher than normal body weight . Try to exercise more.';
    else if (bmi > 18.5)
      return 'You have a normal body weight . Good job!';
    else
      return 'You have a lower than normal body weight . You can eat a bit more.';
  }
}
