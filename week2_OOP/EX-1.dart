enum Skill { FLUTTER, DART, OTHER }

class Address {
  String _street;
  String _city;
  String _zipCode;

  Address(this._street, this._city, this._zipCode);

  void printAddress(){
    print('Address: $_street, $_city, $_zipCode');
  }

  // Getters
  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;
}

class Employee {
  String _name;
  double _baseSalary;
  List<Skill> _skills;
  Address _address;
  int _yearOfExperience;

  Employee(this._name, this._baseSalary, this._skills, this._address, this._yearOfExperience);
  Employee.mobileDeveloper(this._name, this._baseSalary, this._address, this._yearOfExperience, )
   : _skills = [Skill.FLUTTER, Skill.DART];

  // Getters
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => List.unmodifiable(_skills);
  Address get address => _address;
  int get yearOfExperience => _yearOfExperience;


  void printDetails() {
    print('Employee: $_name, Base Salary: \$${_baseSalary}, Year of Experience: $_yearOfExperience');
    print('Skills: ${_skills.map((enumSkill) => enumSkill.name).join(', ')}');
    _address.printAddress();
    print('Total Salary: \$${computeSalary()}');
  }

  double computeSalary() {
    double total = _baseSalary;
    //experience bonus
    total += _yearOfExperience * 200;

    //skill bonus
    for (var skill in _skills) {
      switch (skill){
        case Skill.FLUTTER:
          total += 400;
          break;
        case Skill.DART:
          total += 200;
          break;
        case Skill.OTHER:
          total += 100;
          break;
      }
    }

    return total;
  }
}

void main() {
  var empAddress = Address('Main St2', 'Phnom Penh', 'i1000');

  var emp1 = Employee('Aliza', 50000, [Skill.FLUTTER, Skill.DART], empAddress, 2);
  var emp2 = Employee.mobileDeveloper('liz', 3000, empAddress, 3);

  emp1.printDetails();
  emp2.printDetails();
  print(emp1.name);


}