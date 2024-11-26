// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class WeightWidget extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;

  const WeightWidget({super.key, required this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Weight (kg):"),
        SizedBox(
            width: 60,
            height: 30,
            child: TextField(
              onChanged: onChanged,
              cursorHeight: 15,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
              controller: controller,
            )),
      ],
    );
  }
}
