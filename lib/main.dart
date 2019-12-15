import 'package:flutter/material.dart';
import 'package:flutter_run/app/widget/widget.dart';

import 'app/team/team.dart';
import 'app/widget/widget_common.dart';
import 'app/widget/widget_router_data.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => MainPage());
          case '/widget_common':
            return MaterialPageRoute(
                builder: (context) =>
                    WigetDisplayPage(settings.arguments as RouterData));
          case '/flutter_team':
            return MaterialPageRoute(builder: (context) => TeamPage());
          default:
            return MaterialPageRoute();
        }
      },
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
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/ic_avatar.jpeg"))),
                ),
                accountEmail: Text("cnscott.lee@gmail.com"),
                accountName: Text("Scott Lee"),
              ),
              ListTile(
                leading: Icon(Icons.touch_app),
                title: Text("Widget"),
                onTap: () {
                  Navigator.pushNamed(context, '/widget');
                },
              ),
              ListTile(
                leading: Icon(Icons.cake),
                title: Text("Flutter Team"),
                onTap: () {
                  Navigator.pushNamed(context, "/flutter_team");
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text("Favorite"),
              ),
              ListTile(
                leading: Icon(Icons.feedback),
                title: Text("About"),
              )
            ],
          ),
        ));
  }
}
