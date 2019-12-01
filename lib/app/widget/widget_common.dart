import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_run/app/widget/router_data.dart';
import 'package:flutter_run/utils/syntax_highlight.dart';
import 'package:http/http.dart' as http;

const GITHUB_PREFIX =
    "https://raw.githubusercontent.com/PicoScott/flutter_run/master/";

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
          children: <Widget>[
            _data.preview(),
            _data.introduce(),
            _CodeView(codePath: _data.code)
          ],
        ));
  }
}

class _CodeView extends StatefulWidget {
  final String codePath;
  _CodeView({@required this.codePath}) {
    assert(codePath != null);
  }
  @override
  State<StatefulWidget> createState() {
    return _CodeState(codePath: codePath);
  }
}

class _CodeState extends State<_CodeView> {
  final String codePath;
  _CodeState({@required this.codePath}) {
    assert(codePath != null);
  }
  String text = "";
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    print(GITHUB_PREFIX + codePath.toString());
    var response = await http.get(GITHUB_PREFIX + codePath);
    text = response.body;
    setState(() {});
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 800.0,
        child: Scrollbar(
          /// For vertical scrolling
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int i) {
              return Container(
                padding: EdgeInsets.all(8.0),
                child: SelectableText.rich(
                  DartSyntaxHighlighter(
                          SyntaxHighlighterStyle.lightThemeStyle())
                      .format(text),
                  showCursor: false,
                  cursorColor: Colors.blue,
                  cursorRadius: Radius.circular(5),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
