import 'package:flutter/material.dart';

class W48UI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      width: 240,
      height: 240,
      child: _ContentWidget(),
    )));
  }
}

class _ContentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContentState();
  }
}

class _ContentState extends State<_ContentWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
        
    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "词汇水平测试",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "Aa",
                style: TextStyle(fontSize: 84, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Opacity(
          opacity: _controller.value,
          child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                  margin: EdgeInsets.only(left: 90),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                  child: Text("基础"))),
        ),
        Opacity(
          opacity: _controller.value,
          child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                  child: Text("高阶"))),
        ),
        Opacity(
          opacity: _controller.value,
          child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  margin: EdgeInsets.only(bottom: 30, right: 20),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                  child: Text("专四"))),
        ),
        Opacity(
          opacity: _controller.value,
          child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                  margin: EdgeInsets.only(left: 40, bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                  child: Text("专八"))),
        ),
        Opacity(
          opacity: _controller.value,
          child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                  child: Text("专八"))),
        ),
      ],
    );
  }
}
