// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class BmiTableWidget extends StatelessWidget {
  final List<List<String>> bmiClassification;

  const BmiTableWidget({super.key, required this.bmiClassification});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Table(
          border: TableBorder.all(borderRadius: BorderRadius.circular(5.0)),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(decoration: BoxDecoration(color: Colors.white), children: [
              TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Classification",
                      style: TextStyle(fontSize: 18),
                    ),
                  )),
              TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("BMI range - kg/m2",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                        )),
                  ))
            ]),
            ...List.generate(
              bmiClassification.length,
              (index) => TableRow(
                  decoration: BoxDecoration(color: Colors.white),
                  children: [
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(bmiClassification[index][0]),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            bmiClassification[index][1],
                            textAlign: TextAlign.center,
                          ),
                        ))
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
