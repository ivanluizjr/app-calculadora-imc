import 'package:flutter/material.dart';

class AgeController extends ValueNotifier<int> {
  AgeController() : super(20);

  void subAge() {
    if (value > 0) {
      value--;
    }
  }

  void addAge() {
    value++;
  }
}
