import 'package:flutter/material.dart';
import 'package:flutter_run/widget/markdown_introduce.dart';
import 'package:flutter_run/widget/option_menu.dart';

class FlexPreview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ColumnState();
  }
}

class _ColumnState extends State<FlexPreview> {
  Axis _direction = Axis.horizontal;
  MainAxisAlignment _mainAxisAligment = MainAxisAlignment.start;
  MainAxisSize _mainAxisSize = MainAxisSize.max;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;
  TextDirection _textdirection = TextDirection.ltr;
  VerticalDirection _verticalDirection = VerticalDirection.down;
  TextBaseline _textBaseline = TextBaseline.ideographic;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flex(
        direction: _direction,
        mainAxisAlignment: _mainAxisAligment,
        mainAxisSize: _mainAxisSize,
        crossAxisAlignment: _crossAxisAlignment,
        textDirection: _textdirection,
        verticalDirection: _verticalDirection,
        textBaseline: _textBaseline,
        children: <Widget>[
          Text("Flex child 1"),
          Text("Flex child 2"),
          Text("Flex child 3"),
          Text("Flex child 4"),
          Text("Flex child 5"),
          Text("Flex child 6"),
          Text("Flex child 7"),
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

Widget flexIntroduce = MarkdownView(FLEX_INTRODUCE);

const FLEX_INTRODUCE = """
### Flex Test
* test
""";
