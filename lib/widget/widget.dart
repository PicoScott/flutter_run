import 'package:flutter/material.dart';
import 'package:flutter_run/widget/text.dart';

class WidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WidgetStates();
}

class WidgetStates extends State<WidgetPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: new Text("Widget"),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
        ),
        body: GridView.builder(
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewRoute();
                }))
              },
              child: Center(child: Text(index.toString())),
            );
          },
        ),
      ),
    );
  }
}
