import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_calculator/providers/theme_provider.dart';
import 'package:tip_calculator/providers/tip_provider.dart';
import 'bill_amount_text_field.dart';
import 'person_counter.dart';
import 'tip_slider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<TipProvider>(
        create: (context) => TipProvider(),
      ),
      ChangeNotifierProvider<ThemeProvider>(
        create: (context) => ThemeProvider(),
      )
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Tip Calculator',
      theme: themeProvider.getCurrentTheme(),
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
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    var themeContext = Theme.of(context);
    final textStyle =
        themeContext.textTheme.titleMedium!.copyWith(color: Colors.white);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tip Calculator"),
        actions: [
          IconButton(
            onPressed: () => themeProvider.toggleTheme(),
            icon: themeProvider.isDarkMode
                ? const Icon(
                    Icons.wb_sunny,
                  )
                : const Icon(
                    Icons.nightlight_round,
                  ),
          ),
        ],
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
                  Consumer<TipProvider>(
                    builder: (BuildContext context, TipProvider value,
                        Widget? child) {
                      return Text(
                        value.getTotalTipPerPerson(),
                        style: textStyle.copyWith(
                            fontSize:
                                themeContext.textTheme.displaySmall!.fontSize),
                      );
                    },
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
                  const BillAmountTextField(),
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
                            Consumer<TipProvider>(
                              builder: (BuildContext context, TipProvider value,
                                  Widget? child) {
                                return Text(
                                  "\$${value.getTip()}",
                                  style: themeContext.textTheme.bodyMedium,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const TipSlider()
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
