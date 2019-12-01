import 'package:flutter/material.dart';
import 'package:flutter_run/app/widget/router_data.dart';

class WidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WidgetStates();
}

class WidgetStates extends State<WidgetPage> {
  final displayNameMap = const {0: "Text"};
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: ListView.builder(
            itemCount: widgetRouter.length,
            itemBuilder: (context, index) {
              return Container(
                // decoration: BoxDecoration(boxShadow: [
                //   BoxShadow(color: Colors.black12, offset: Offset(1.4, 1.4))
                // ]),
                child: ExpansionTile(
                  backgroundColor: Colors.white,
                  title: Text(widgetRouter[index].title),
                  leading: Icon(widgetRouter[index].icon),
                  trailing: Icon(Icons.expand_more),
                  children: <Widget>[
                    for (var data in widgetRouter[index].expandData)
                      WidgetItem(data)
                  ],
                ),
              );
            }));
  }
}

class WidgetItem extends StatefulWidget {
  RouterData data;
  WidgetItem(RouterData data) : super() {
    this.data = data;
  }

  @override
  State<StatefulWidget> createState() {
    return WidgetItemState(data);
  }
}

class WidgetItemState extends State<WidgetItem> {
  RouterData data;
  WidgetItemState(RouterData data) : super() {
    this.data = data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 16),
        child: ListTile(
          leading: GestureDetector(
              child: data.selected
                  ? Icon(Icons.favorite_border)
                  : Icon(Icons.favorite, color: Colors.redAccent),
              onTap: () {
                print(data.selected);
                data.selected = !data.selected;
                setState(() => {});
                return true;
              }),
          title: Text(data.title),
          trailing: Icon(Icons.arrow_right),
          onTap: () => Navigator.of(context)
              .pushNamed("/widget_common", arguments: data),
        ));
  }
}
