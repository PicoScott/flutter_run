import 'package:flutter/material.dart';
import 'package:flutter_run/app/team/w48_ui.dart';

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Team"),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => ListTile(
          title: Text("W48 UI"),
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => W48UI())),
        ),
      ),
    );
  }
}
