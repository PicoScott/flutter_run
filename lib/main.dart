import 'package:flutter/material.dart';
import 'package:flutter_run/widget/widget.dart';
import 'package:flutter_run/about/about.dart';

void main() => runApp(new RunApp());

class RunApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RunAppSate();
  }
}

class RunAppSate extends State<RunApp> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new WidgetPage(),
          new AboutPage(),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        child: new TabBar(
          controller: controller,
          labelColor: Colors.deepPurpleAccent,
          tabs: <Widget>[
            new Tab(text: "首页", icon: new Icon(Icons.widgets)),
            new Tab(
              text: "About",
              icon: new Icon(Icons.apps),
            )
          ],
          indicator: null,
        ),
      ),
    ));
  }
}
