import 'package:flutter/material.dart';

class WeightController extends ValueNotifier<int> {
  WeightController() : super(50);

  void subPeso() {
    if (value > 0) {
      value--;
    }
  }

  void addPeso() {
    value++;
  }
}
