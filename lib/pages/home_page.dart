// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bmi_calculator/widgets/bmi_table_widget.dart';
import 'package:bmi_calculator/widgets/calculate_widget.dart';
import 'package:bmi_calculator/widgets/height_widget.dart';
import 'package:bmi_calculator/widgets/output_widget.dart';
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

  final List<List<String>> _bmiClassification = [
    ["Severe Thinness", "< 16"],
    ["Moderate Thinness", "16 - 17"],
    ["Mild Thinness", "17 - 18.5"],
    ["Normal", "18.5 - 25"],
    ["Overweight", "25 - 30"],
    ["Obese Class I", "30 - 35"],
    ["Obese Class II", "35 - 40"],
    ["Obese Class III", "> 40"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 242, 248),
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
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
                borderRadius: BorderRadius.circular(5.0),
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
            ),
            SizedBox(
              height: 20.0,
            ),
            _bmiResult.isFinite && _bmiResult != 0.0 ? OutputWidget(
              bmiResult: _bmiResult,
            ) : SizedBox(),
            _bmiResult.isFinite && _bmiResult != 0.0 ? BmiTableWidget(
              bmiClassification: _bmiClassification,
            ) : SizedBox()
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
