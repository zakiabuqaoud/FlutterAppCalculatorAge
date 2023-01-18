

class CalculatorAge{
  static int age = 0;

  CalculatorAge(int year){
    age = DateTime.now().year - year;
  }
}