import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_calculator/providers/tip_provider.dart';

class PersonCounter extends StatelessWidget {
  const PersonCounter({super.key, required this.themeContext});

  final ThemeData themeContext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Consumer<TipProvider>(
        builder: (BuildContext context, TipProvider value, Widget? child) {
          return Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                color: themeContext.colorScheme.primary,
                onPressed: value.decreasePersonCount,
              ),
              Text(
                value.peronsCount.toString(),
                style: themeContext.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                color: themeContext.colorScheme.primary,
                onPressed: value.addPersonCount,
              ),
            ],
          );
        },
      ),
    );
  }
}
