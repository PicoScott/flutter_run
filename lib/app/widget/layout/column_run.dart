import 'package:flutter/material.dart';
import 'package:flutter_run/widget/option_menu.dart';

class ColumnPreview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ColumnState();
  }
}

class _ColumnState extends State<ColumnPreview> {
  MainAxisAlignment _mainAxisAligment = MainAxisAlignment.start;
  MainAxisSize _mainAxisSize = MainAxisSize.max;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;
  TextDirection _textdirection = TextDirection.ltr;
  VerticalDirection _verticalDirection = VerticalDirection.down;
  TextBaseline _textBaseline = TextBaseline.ideographic;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: _mainAxisAligment,
        mainAxisSize: _mainAxisSize,
        crossAxisAlignment: _crossAxisAlignment,
        textDirection: _textdirection,
        verticalDirection: _verticalDirection,
        textBaseline: _textBaseline,
        children: <Widget>[
          Text(
            "Column child 1",
          ),
          Text("Column child 2"),
          Text("Column child 3"),
          Text("Column child 4"),
        ],
      ),
      bottomNavigationBar: _getController(),
    );
  }

  Widget _getController() {
    return Container(
        color: Colors.lightBlue,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            OptionMenu<MainAxisAlignment>(
              menuItem: MainAxisAlignment.values,
              defaultValue: _mainAxisAligment,
              onValueChanged: (MainAxisAlignment data) =>
                  setState(() => _mainAxisAligment = data),
            ),
            OptionMenu<MainAxisSize>(
              menuItem: MainAxisSize.values,
              defaultValue: _mainAxisSize,
              onValueChanged: (MainAxisSize data) =>
                  setState(() => _mainAxisSize = data),
            ),
            OptionMenu<CrossAxisAlignment>(
              menuItem: CrossAxisAlignment.values,
              defaultValue: _crossAxisAlignment,
              onValueChanged: (CrossAxisAlignment data) =>
                  setState(() => _crossAxisAlignment = data),
            ),
            OptionMenu<TextDirection>(
              menuItem: TextDirection.values,
              defaultValue: _textdirection,
              onValueChanged: (TextDirection data) =>
                  setState(() => _textdirection = data),
            ),
            OptionMenu<TextBaseline>(
              menuItem: TextBaseline.values,
              defaultValue: TextBaseline.ideographic,
              onValueChanged: (TextBaseline data) =>
                  setState(() => _textBaseline = data),
            ),
          ],
        ));
  }
}

class ColumnIntroduce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Row introduce");
  }
}
