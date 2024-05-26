import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_calculator/providers/tip_provider.dart';

class BillAmountTextField extends StatelessWidget {
  const BillAmountTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TipProvider>(
      builder: (BuildContext context, TipProvider value, Widget? child) {
        return TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: const Icon(Icons.attach_money),
            labelText: 'Bill Amount',
          ),
          keyboardType: TextInputType.number,
          onChanged: value.setBillAmount,
        );
      },
    );
  }
}
