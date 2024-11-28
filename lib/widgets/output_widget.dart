// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class OutputWidget extends StatelessWidget {
  final double bmiResult;
  final String classification;

  const OutputWidget({
    super.key,
    required this.bmiResult,
    required this.classification,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
      child: Text(
        "BMI: ${bmiResult.toStringAsFixed(1)} ($classification)",
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
    ));
  }
}
