import 'package:flutter/material.dart';
import 'package:flutter_run/app/widget/router_data.dart';
import 'package:flutter_run/app/widget/widget.dart';

import 'app/team/team.dart';
import 'app/widget/widget_common.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => MainPage());
          case '/widget/text':
            return MaterialPageRoute(
                builder: (context) =>
                    WigetDisplayPage(settings.arguments as RouterData));
          default:
            MaterialPageRoute();
        }
      },
      // routes: {
      //   '/': (context) => MainPage(),
      //   '/widget/text': (context) => WigetDisplayPage()
      // },
    ));

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Flutter Run"),
          leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => _scaffoldKey.currentState.openDrawer()),
        ),
        body: new WidgetPage(),
        drawer: Drawer(
          child: Row(
            children: <Widget>[
              GestureDetector(
                  child: Text("Flutter Team"),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TeamPage())))
            ],
          ),
        ));
  }
}
