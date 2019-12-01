import 'package:flutter/material.dart';

class SimpleAnimationPreview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SimpleAnimationState();
  }
}

class _SimpleAnimationState extends State<SimpleAnimationPreview>
    with TickerProviderStateMixin {
  AnimationController _scaleController;
  Animation _scaleAnimation;

  AnimationController _fadeController;
  Animation _fadeAnimation;

  AnimationController _rotateController;

  AnimationController _sizeController;
  Animation _sizeAnimation;

  AnimationController _slideController;
  Animation _slideAnimation;

  AnimationController _decoratedController;
  Animation _decoratedAnimation;

  AnimationController _aliginController;
  Animation _aliginAnimation;

  AnimationController _positionController;
  Animation _positionAnimation;

  AnimationController _relativePositionController;
  Animation _relativePositionAnimation;
  @override
  void initState() {
    super.initState();
    _scaleController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _scaleAnimation = Tween(begin: 1.0, end: 0.0).animate(_scaleController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _scaleController.reverse();
        }
      });

    _fadeController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _fadeAnimation = Tween(begin: 1.0, end: 0.0).animate(_fadeController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) _fadeController.reverse();
      });

    _rotateController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    _sizeController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _sizeAnimation = Tween(begin: 1.0, end: 0.0).animate(_sizeController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) _sizeController.reverse();
      });

    _slideController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _slideAnimation = Tween<Offset>(begin: Offset(0, 0), end: Offset(1, 1))
        .animate(_slideController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) _slideController.reverse();
          });

    _decoratedController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _decoratedAnimation = DecorationTween(
            begin: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.blue, width: 10),
            ),
            end: BoxDecoration(color: Colors.red))
        .animate(_decoratedController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed)
              _decoratedController.reverse();
          });

    _aliginController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _aliginAnimation = AlignmentGeometryTween(
            begin: AlignmentDirectional.center,
            end: AlignmentDirectional.topStart)
        .animate(_aliginController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed)
              _aliginController.reverse();
          });

    _positionController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _positionAnimation = RelativeRectTween(
            end: RelativeRect.fromLTRB(0, 0, 0, 0),
            begin: RelativeRect.fromLTRB(50, 100, 80, 40))
        .animate(_positionController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed)
              _positionController.reverse();
          });

    _relativePositionController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _relativePositionAnimation = RectTween(
            begin: Rect.fromCircle(center: Offset(80.0, 80.0), radius: 10),
            end: Rect.fromCircle(center: Offset(20, 20.0), radius: 20.0))
        .animate(CurvedAnimation(
            parent: _relativePositionController, curve: Curves.easeInOutBack));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        ScaleTransition(
          scale: _scaleAnimation,
          child: TabAnimatedColorSquareText(
            color: Colors.blue,
            text: "Scale Animation",
            controller: _scaleController,
          ),
        ),
        FadeTransition(
          opacity: _fadeAnimation,
          child: TabAnimatedColorSquareText(
            color: Colors.red,
            text: "Opcity Animation",
            controller: _fadeController,
          ),
        ),
        RotationTransition(
          turns: _rotateController,
          child: TabAnimatedColorSquareText(
            color: Colors.green,
            text: "Rotate Transition",
            controller: _rotateController,
          ),
        ),
        SizeTransition(
          sizeFactor: _sizeAnimation,
          axis: Axis.horizontal,
          child: TabAnimatedColorSquareText(
            color: Colors.deepOrange,
            text: "Size Animation",
            controller: _sizeController,
          ),
        ),
        SlideTransition(
          position: _slideAnimation,
          child: TabAnimatedColorSquareText(
            color: Colors.blueGrey,
            text: "Slide Animation",
            controller: _slideController,
          ),
        ),
        DecoratedBoxTransition(
          decoration: _decoratedAnimation,
          child: TabAnimatedColorSquareText(
              color: Colors.transparent,
              text: "Decorated Box Animation",
              controller: _decoratedController),
        ),
        Container(
          color: Colors.grey,
          width: 200,
          height: 200,
          child: AlignTransition(
            alignment: _aliginAnimation,
            child: TabAnimatedColorSquareText(
                color: Colors.cyan,
                text: "Align Transition",
                controller: _aliginController),
          ),
        ),
        Container(
          width: 200,
          height: 200,
          color: Colors.redAccent,
          child: Stack(
            children: <Widget>[
              PositionedTransition(
                  rect: _positionAnimation,
                  child: TabAnimatedColorSquareText(
                    color: Colors.purple,
                    text: "Position Animation",
                    controller: _positionController,
                  )),
            ],
          ),
        ),
        Container(
          width: 200,
          height: 200,
          color: Colors.amberAccent,
          child: Stack(
            children: <Widget>[
              RelativePositionedTransition(
                  rect: _relativePositionAnimation,
                  child: TabAnimatedColorSquareText(
                    color: Colors.teal,
                    text: "Relative Positioned Transition",
                    controller: _relativePositionController,
                  ),
                  size: Size(100, 100)),
            ],
          ),
        )
      ],
    ));
  }
}

class TabAnimatedColorSquareText extends StatelessWidget {
  final Color color;
  final String text;
  final AnimationController controller;
  TabAnimatedColorSquareText(
      {@required this.color, @required this.text, @required this.controller});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 100,
        height: 100,
        color: color,
        child: Center(
            child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        )),
      ),
      onTap: () {
        controller.reset();
        controller.forward();
      },
    );
  }
}

class SimpleAnimationIntroduce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Simple Animation");
  }
}
