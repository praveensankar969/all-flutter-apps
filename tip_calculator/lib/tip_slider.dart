import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_calculator/providers/tip_provider.dart';

class TipSlider extends StatelessWidget {
  const TipSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<TipProvider>(
          builder: (BuildContext context, TipProvider value, Widget? child) {
            return Slider(
              value: value.sliderValue,
              onChanged: value.setSliderValue,
              min: 0,
              max: 0.5,
              divisions: 5,
              label: '${(value.sliderValue * 100).round()}%',
            );
          },
        ),
      ],
    );
  }
}
