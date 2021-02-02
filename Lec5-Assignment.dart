class Person {
  String name;
  int age;
  String type;

  Person(this.name, this.age, this.type);
}

class Employee extends Person with Department, Drivers, TempWorkers {
  String branchName;
  int workingDays;
  int salary;
  double paidSalary;
  bool target;
  int bonus;
  String email;

  Employee(
      {String name,
      int age,
      String type,
      String dep,
      double paidSalary,
      this.salary,
      this.branchName,
      this.workingDays,
      this.target,
      this.email})
      : super(name, age, type) {
    this.dep = dep;
    this.paidSalary = salary * (workingDays / 30);
  }

  Employee.driver(
      {String name,
      int age,
      String type,
      String dep,
      double paidSalary,
      this.salary,
      this.branchName,
      this.workingDays,
      int overtimeHours,
      int vehicleNumber})
      : super(name, age, type) {
    this.overtimeHours = overtimeHours;
    this.vehicleNumber = vehicleNumber;
    this.dep = dep;
    this.paidSalary = salary * (workingDays / 30);
  }

  Employee.tempWorker(
      {String name,
      int age,
      String type,
      String dep,
      double paidSalary,
      this.branchName,
      this.workingDays,
      double dailyCompensation})
      : super(name, age, type) {
    this.dep = dep;
    this.dailyCompensation = dailyCompensation;
    this.paidSalary = dailyCompensation * workingDays;
  }

  empBonus() {
    if (dep != "Drivers" && target == true) {
      return paidSalary * 1.10;
    } else {
      return "No Bonus";
    }
  }

  driverBonus() {
    if (dep == "Drivers" && overtimeHours == 30) {
      return paidSalary * 1.15;
    } else {
      return "No Bonus";
    }
  }

  String employeeAppraisal() {
    if (dep != "Driver" && workingDays == 30 && target == true) {
      return "promoted";
    } else {
      return "performance below  expectations";
    }
  }

  String driverAppraisal() {
    if (dep == "Drivers" && workingDays == 30 && overtimeHours > 20) {
      return "promoted";
    } else {
      return "performance below expectations";
    }
  }
}

mixin Department {
  String dep;
}

mixin Drivers {
  int vehicleNumber;
  int overtimeHours;
}

mixin TempWorkers {
  double dailyCompensation;
}

class Visitor extends Person {
  String visitDay;
  String duration;
  String location;

  Visitor(
      {String name,
      int age,
      String type,
      this.visitDay,
      this.duration,
      this.location})
      : super(name, age, type);
}

main() {
  Employee emp1 = Employee(
      name: "Ahmed Adel",
      age: 27,
      type: "staff",
      branchName: "Cairo",
      dep: "Customer Service",
      workingDays: 30,
      salary: 4000,
      target: true,
      email: "a.adel@companydomain.com");

  Employee emp2 = Employee.driver(
      name: "Ali Saad",
      age: 29,
      type: "staff",
      dep: "Drivers",
      branchName: "Alex",
      workingDays: 27,
      salary: 2500,
      overtimeHours: 30,
      vehicleNumber: 135);

  Employee tempWorker1 = Employee.tempWorker(
    name: "Kamel Mohamed",
    age: 28,
    type: "tempStaff",
    branchName: "Giza",
    dep: "Security",
    workingDays: 15,
    dailyCompensation: 150.0,
  );

  Visitor visitor1 = Visitor(
      name: "Saif Samir",
      age: 35,
      type: "client",
      visitDay: "Sunday",
      duration: "30 Minutes",
      location: "Giza Branch");

  print(emp1.paidSalary);
  print(emp1.empBonus());
  print(emp1.employeeAppraisal());
  print(emp2.vehicleNumber);
  print(emp2.paidSalary);
  print(emp2.driverBonus());
  print(emp2.driverAppraisal());
  print(visitor1.name);
  print(visitor1.type);
  print(visitor1.location);
  print(tempWorker1.type);
  print(tempWorker1.dep);
  print(tempWorker1.paidSalary);
}
