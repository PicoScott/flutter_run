import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_run/app/widget/router_data.dart';

class WigetDisplayPage extends StatefulWidget {
  final RouterData _data;
  WigetDisplayPage(this._data);
  @override
  State<StatefulWidget> createState() {
    return WigetDisplayPageState(_data);
  }
}

class WigetDisplayPageState extends State<WigetDisplayPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  RouterData _data;
  WigetDisplayPageState(this._data);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_data.title),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                text: "Preview",
                icon: Icon(Icons.visibility),
              ),
              Tab(
                text: "Introduce",
                icon: Icon(Icons.chat),
              ),
              Tab(
                text: "Code",
                icon: Icon(Icons.code),
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          dragStartBehavior: DragStartBehavior.start,
          children: <Widget>[_data.preview(), _data.introduce(), Text("Code")],
        ));
  }
}
