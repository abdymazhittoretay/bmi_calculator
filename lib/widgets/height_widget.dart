// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HeightWidget extends StatelessWidget {
  const HeightWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Height (kg):"),
        SizedBox(
            width: 60,
            height: 30,
            child: TextField(
              cursorHeight: 15,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(
                        horizontal: 8.0
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            )),
      ],
    );
  }
}
