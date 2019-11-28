import 'package:flutter/material.dart';
import 'package:flutter_run/app/widget/router_data.dart';
import 'package:flutter_run/widget/detail_title.dart';

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
          title: Text("Text"),
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
        body: Row(
          children: <Widget>[TitleText("描述")],
        ));
  }
}