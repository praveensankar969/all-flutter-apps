import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(0),
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
