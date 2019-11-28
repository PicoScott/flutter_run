import 'package:flutter/material.dart';

class RouterData {
  final int index;
  String title;
  String description;
  String routerName;
  IconData icon;
  bool selected;
  List<RouterData> expandData;
  RouterData(
      {this.index,
      this.title,
      this.description,
      this.routerName,
      this.icon,
      this.selected = false,
      this.expandData});
}

List<RouterData> widgetRouter = [
  RouterData(
      index: 0,
      title: "Text",
      icon: Icons.text_fields,
      expandData: <RouterData>[
        RouterData(
            index: 1,
            title: "Text",
            icon: Icons.text_fields,
            routerName: '/widget/text')
      ]),
];
