import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  const TipSlider(
      {super.key, required double sliderValue, required this.onChanged})
      : _sliderValue = sliderValue;

  final double _sliderValue;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: _sliderValue,
          onChanged: onChanged,
          min: 0,
          max: 0.5,
          divisions: 5,
          label: '${(_sliderValue * 100).round()}%',
        ),
      ],
    );
  }
}
