main() {
  // function to create a new list of existing list

  List<double> salaries = [1120, 2340, 6730, 5670];
  double inc = 0.10;
  double dec = 0.05;
  double companyCapital = 17000;

  List<double> salInc(List<double> x, double y) {
    List<double> newSalaries = [];
    List<double> approvedSalaries = [];

    for (double i in x) {
      var newSalary = i + i * inc;
      newSalaries.add(newSalary);
    }

    double totalNewSalaries = newSalaries.reduce((a, b) => a + b);
    print(totalNewSalaries);

    if (totalNewSalaries > companyCapital) {
      for (double p in x) {
        var newSalary = p + p * dec;
        approvedSalaries.add(newSalary);
      }
    }

    return approvedSalaries;
  }

  print("the employees new salaries are ${salInc(salaries, dec)}");
}
