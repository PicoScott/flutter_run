import 'package:flutter/material.dart';
import 'package:flutter_run/widget/markdown_introduce.dart';
import 'package:flutter_run/widget/option_menu.dart';

class RowPreview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RowState();
  }
}

class _RowState extends State<RowPreview> {
  MainAxisAlignment _mainAxisAligment = MainAxisAlignment.start;
  MainAxisSize _mainAxisSize = MainAxisSize.max;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;
  TextDirection _textdirection = TextDirection.ltr;
  VerticalDirection _verticalDirection = VerticalDirection.down;
  TextBaseline _textBaseline = TextBaseline.ideographic;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: _mainAxisAligment,
        mainAxisSize: _mainAxisSize,
        crossAxisAlignment: _crossAxisAlignment,
        textDirection: _textdirection,
        verticalDirection: _verticalDirection,
        textBaseline: _textBaseline,
        children: <Widget>[
          Text("Row child 1"),
          Text("Row child 2"),
          Text("Row child 3"),
          Text("Row child 4"),
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

class RowIntroduce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Row introduce");
  }
}

Widget rowIntroduce = MarkdownView(ROW_INTRODUCE);
const ROW_INTRODUCE = """
### 参数介绍
- textDirection：表示水平方向子组件的布局顺序。
- mainAxisSize：表示Row在主轴(水平)方向占用的空间，默认是 MainAxisSize.max
    - MainAxisSize.max 表示尽可能多的占用水平方向的空间； 
    - MainAxisSize.min 表示尽可能少的占用水平空间
- mainAxisAlignment：表示子组件在Row所占用的水平空间内对齐方式

```
public static void mian(){

}
```

- verticalDirection：表示Row纵轴（垂直）的对齐方向，默认是VerticalDirection.down，表示从上到下。
- crossAxisAlignment：表示子组件在纵轴方向的对齐方式，Row的高度等于子组件中最高的子元素高度，它的取值和MainAxisAlignment一样(包含start、end、 center三个值)，不同的是crossAxisAlignment的参考系是verticalDirection，即verticalDirection值为VerticalDirection.down时crossAxisAlignment.start指顶部对齐，verticalDirection值为VerticalDirection.up时，crossAxisAlignment.start指底部对齐；而crossAxisAlignment.end和crossAxisAlignment.start正好相反；
- children ：子组件数组。
""";
