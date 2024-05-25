import 'dart:ffi';

import 'package:flutter/material.dart';

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

  void _addPersonCount() {
    setState(() {
      _personCount += 1;
    });
  }

  void _decreasePersonCount() {
    setState(() {
      if (_personCount > 1) {
        _personCount += 1;
      }
    });
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
                    " \$ 23.00",
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
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.attach_money),
                      labelText: 'Bill Amount',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {},
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
                            subCounter: _decreasePersonCount)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PersonCounter extends StatelessWidget {
  const PersonCounter(
      {super.key,
      required this.themeContext,
      required int personCount,
      required this.addCounter,
      required this.subCounter})
      : _personCount = personCount;

  final ThemeData themeContext;
  final int _personCount;
  final VoidCallback addCounter;
  final VoidCallback subCounter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            color: themeContext.colorScheme.primary,
            onPressed: subCounter,
          ),
          Text(
            _personCount.toString(),
            style: themeContext.textTheme.bodyMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            color: themeContext.colorScheme.primary,
            onPressed: addCounter,
          ),
        ],
      ),
    );
  }
}
