import 'package:flutter/material.dart';

class TitleText extends Text {
  TitleText(String data)
      : super(data,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20));
}
