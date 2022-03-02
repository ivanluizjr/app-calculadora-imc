import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Gender {
  female,
  male,
}

class Controller extends ChangeNotifier {
  Gender selectedGender;
  int weight = 50;
  int age = 15;

  void subPeso() {
    if (weight > 0) {
      weight--;
      notifyListeners();
    }
  }

  void addPeso() {
    weight++;
    notifyListeners();
  }

  void genderMale() {
    selectedGender = Gender.male;
    notifyListeners();
  }

  void genderFemale() {
    selectedGender = Gender.female;
    notifyListeners();
  }

  void subAge() {
    if (age > 0) {
      age--;
      notifyListeners();
    }
  }

  void addAge() {
    age++;
    notifyListeners();
  }
}
