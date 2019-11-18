import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()  => AboutStates();
}

class AboutStates extends State<AboutPage>{
    @override
    Widget build(BuildContext context) {
    return MaterialApp(
        home: new Scaffold(
          appBar: AppBar(title: new Text("Widget"),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          ),
          body: new Text("Widget"),
        ),
    );
  }
}
