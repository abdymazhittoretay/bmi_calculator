// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bmi_calculator/widgets/calculate_widget.dart';
import 'package:bmi_calculator/widgets/height_widget.dart';
import 'package:bmi_calculator/widgets/weight_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _heightController = TextEditingController();
  double? _heightValue = 0.0;

  final TextEditingController _weightController = TextEditingController();
  double? _weightValue = 0.0;

  double _bmiResult = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 242, 248),
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 243, 242, 248),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: [
                  HeightWidget(
                    controller: _heightController,
                    onChanged: onChangedHeight,
                  ),
                  Divider(
                    height: 40.0,
                    color: Colors.black54,
                  ),
                  WeightWidget(
                    controller: _weightController,
                    onChanged: onChangedWeight,
                  ),
                ],
              ),
            ),
            CalculateWidget(
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }

  // Functions
  void onChangedHeight(value) {
    setState(() {
      _heightValue = double.tryParse(_heightController.text);
    });
  }

  void onChangedWeight(value) {
    setState(() {
      _weightValue = double.tryParse(_weightController.text);
    });
  }

  void onPressed() {
    if (_heightValue != null && _weightValue != null) {
      setState(() {
        _bmiResult = _weightValue! / ((_heightValue! * _heightValue!) / 10000);
      });
    } else {
      setState(() {
        _bmiResult = 0.0;
      });
    }
    print(_bmiResult.toStringAsFixed(1));
  }
}
