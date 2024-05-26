import 'package:flutter/material.dart';
import 'person_counter.dart';
import 'tip_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 52, 7, 255)),
        useMaterial3: true,
      ),
      home: const TipCalculator(),
    );
  }
}

class TipCalculator extends StatefulWidget {
  const TipCalculator({super.key});

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  int _personCount = 1;
  double _sliderValue = 0.0;
  String _billAmount = "0";

  void _addPersonCount() {
    setState(() {
      if (int.parse(_getTip()) > _personCount) {
        _personCount += 1;
      }
    });
  }

  void _decreasePersonCount() {
    setState(() {
      if (_personCount > 1) {
        _personCount -= 1;
      }
    });
  }

  void _setSliderValue(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  void _setBillAmount(String value) {
    setState(() {
      _billAmount = value;
    });
  }

  String _getTip() {
    return '${(int.parse(_billAmount) * _sliderValue).round()}';
  }

  String _getTotalTipPerPerson() {
    return '\$${(int.parse(_billAmount) * _sliderValue / _personCount).toStringAsFixed(2)}';
  }

  @override
  Widget build(BuildContext context) {
    var themeContext = Theme.of(context);
    final textStyle =
        themeContext.textTheme.titleMedium!.copyWith(color: Colors.white);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tip Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: themeContext.colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Text(
                    "Total per person",
                    style: textStyle,
                  ),
                  Text(
                    _getTotalTipPerPerson(),
                    style: textStyle.copyWith(
                        fontSize:
                            themeContext.textTheme.displaySmall!.fontSize),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: themeContext.colorScheme.primary,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  BillAmountTextField(
                    onChanged: _setBillAmount,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Split',
                          style: themeContext.textTheme.bodyMedium,
                        ),
                        PersonCounter(
                          themeContext: themeContext,
                          personCount: _personCount,
                          addCounter: _addPersonCount,
                          subCounter: _decreasePersonCount,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, left: 20, right: 30, bottom: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tip",
                              style: themeContext.textTheme.bodyMedium,
                            ),
                            Text(
                              "\$${_getTip()}",
                              style: themeContext.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      TipSlider(
                        sliderValue: _sliderValue,
                        onChanged: _setSliderValue,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BillAmountTextField extends StatelessWidget {
  const BillAmountTextField({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: const Icon(Icons.attach_money),
        labelText: 'Bill Amount',
      ),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }
}
