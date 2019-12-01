import 'package:flutter/material.dart';

// class HeroAnimationPreview extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(body: _HomePage()),
//     );
//   }
// }

class HeroAnimationPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Align(
            alignment: AlignmentDirectional.bottomCenter, child: _HomePage()),
      ),
    );
  }
}

class _HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: InkWell(
          onTap: () {
            // print("object");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => _PlayerPage()));
          },
          child: Stack(
            children: <Widget>[
              Align(
                alignment: AlignmentDirectional.centerStart,
                widthFactor: 0.2,
                child: Hero(
                    tag: HERO_IMAGE,
                    child: Container(
                      width: 40,
                      height: 40,
                      color: Colors.red,
                    )),
              ),
              Align(
                alignment: FractionalOffset(-2.0, 0),
                widthFactor: 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: HERO_TITLE,
                      child: Text(
                        "Lily",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Hero(
                      tag: HERO_AUTHOR,
                      child: Text("Alan Walker"),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Hero(
                  tag: HERO_PLAY_BUTTON,
                  child: Icon(Icons.play_circle_outline),
                ),
              )
            ],
          )),
    );
  }
}

const HERO_IMAGE = "hero_image";
const HERO_TITLE = "hero_title";
const HERO_AUTHOR = "hero_author";
const HERO_PLAY_BUTTON = "hero_play_button";

class _PlayerPage extends StatelessWidget {
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
        body: Center(
            child: Column(
          children: <Widget>[
            Hero(
              tag: HERO_TITLE,
              child: Text(
                "Lily",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            Hero(
              tag: HERO_AUTHOR,
              child: Text("Alan Walker"),
            ),
            Hero(
                tag: HERO_IMAGE,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                )),
            Hero(
              tag: HERO_PLAY_BUTTON,
              child: Icon(Icons.play_circle_outline),
            ),
          ],
        )));
  }
}

class HeroAnimationIntroduce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Route Animationo Introduce");
  }
}
