import 'package:flutter/material.dart';

class RouteAnimationPreview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RouteAnimationState();
  }
}

class _RouteAnimationState extends State<RouteAnimationPreview> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => Scaffold(
                body: ListView(
              children: <Widget>[
                InkWell(
                  child: ListTile(
                    title: Text("Fade"),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 500),
                            pageBuilder: (BuildContext context,
                                Animation animation,
                                Animation secondaryAnimation) {
                              return new FadeTransition(
                                opacity: animation,
                                child: _PageB(),
                              );
                            }));
                  },
                ),
                InkWell(
                  child: ListTile(
                    title: Text("Scale"),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration: Duration(microseconds: 1000),
                            pageBuilder: (BuildContext context,
                                Animation animation,
                                Animation secondaryAnimation) {
                              return new ScaleTransition(
                                  scale: animation, child: _PageB());
                            }));
                  },
                ),
                InkWell(
                  child: ListTile(
                    title: Text("Right to left"),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 500),
                            pageBuilder: (BuildContext context,
                                Animation animation,
                                Animation secondaryAnimation) {
                              return new SlideTransition(
                                  position: Tween<Offset>(
                                          begin: Offset(1, 0),
                                          end: Offset(0, 0))
                                      .animate(animation),
                                  child: _PageB());
                            }));
                  },
                )
              ],
            ))
      },
    );
  }
}

class _PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
        title: Text("Route Page B"),
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: Text("This is page B"),
      ),
    );
  }
}

class RouteAnimationIntroduce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Route Animationo Introduce");
  }
}
