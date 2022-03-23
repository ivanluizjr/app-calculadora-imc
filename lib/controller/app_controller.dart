import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Gender {
  female,
  male,
}

enum SelectedIcon {
  active,
  inactive,
}

class Controller extends ChangeNotifier {
  Gender? selectedGender;
  SelectedIcon? selectedIcon;
  // final weight = ValueNotifier<int>(50);
  // final age = ValueNotifier<int>(15);

  // void subPeso() {
  //   if (weight.value > 0) {
  //     weight.value--;
  //   }
  // }

  // void addPeso() {
  //   weight.value++;
  // }

  void genderMale() {
    selectedGender = Gender.male;
    notifyListeners();
  }

  void genderFemale() {
    selectedGender = Gender.female;
    notifyListeners();
  }

  // void subAge() {
  //   if (age.value > 0) {
  //     age.value--;
  //   }
  // }

  // void addAge() {
  //   age.value++;
  // }

  void iconActive() {
    selectedIcon = SelectedIcon.active;
    notifyListeners();
  }

  void iconInactive() {
    selectedIcon = SelectedIcon.inactive;
    notifyListeners();
  }
}
