import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return null;
  }
}

class _TestState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              Container(
                color: Colors.blueAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
