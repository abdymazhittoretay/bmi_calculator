// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class OutputWidget extends StatelessWidget {
  final double bmiResult;

  const OutputWidget({super.key, required this.bmiResult});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: bmiResult.isFinite && bmiResult != 0.0
          ? Text(
              "BMI: ${bmiResult.toStringAsFixed(1)}",
              style: TextStyle(fontSize: 24.0,),
            )
          : null,
    );
  }
}
