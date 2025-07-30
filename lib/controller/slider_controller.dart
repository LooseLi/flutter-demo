import 'package:flutter/material.dart';

class SliderController extends ChangeNotifier {
  double _value = 0.0;

  SliderController([this._value = 0.0]);

  double get value => _value;

  set value(double newValue) {
    _value = newValue;
    notifyListeners();
  }

  void setMax() {
    _value = 1.0;
    notifyListeners();
  }

  void onSlider(value) {
    _value = value;
    notifyListeners();
  }
}
