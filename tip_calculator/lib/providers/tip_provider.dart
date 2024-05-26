import 'package:flutter/material.dart';

class TipProvider extends ChangeNotifier {
  int _personCount = 1;
  int get peronsCount => _personCount;
  double _sliderValue = 0.0;
  double get sliderValue => _sliderValue;
  String _billAmount = "0";
  String get billAmount => _billAmount;

  void addPersonCount() {
    if (int.parse(getTip()) > _personCount) {
      _personCount += 1;
    }
    notifyListeners();
  }

  void decreasePersonCount() {
    if (_personCount > 1) {
      _personCount -= 1;
    }
    notifyListeners();
  }

  void setSliderValue(double value) {
    _sliderValue = value;
    notifyListeners();
  }

  void setBillAmount(String value) {
    _billAmount = value;
    notifyListeners();
  }

  String getTip() {
    return '${(int.parse(_billAmount) * _sliderValue).round()}';
  }

  String getTotalTipPerPerson() {
    return '\$${(int.parse(_billAmount) * _sliderValue / _personCount).toStringAsFixed(2)}';
  }
}
