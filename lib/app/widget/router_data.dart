import 'package:flutter/material.dart';
import 'package:flutter_run/app/widget/animation/hero_animation_run.dart';
import 'package:flutter_run/app/widget/animation/route_animation_run.dart';
import 'package:flutter_run/app/widget/animation/simple_animation_run.dart';

typedef PreviewWidgetFactory = Widget Function();
typedef IntroduceWidgetFactory = Widget Function();

class RouterGroup {
  final String title;
  final String description;
  final IconData icon;
  final List<RouterData> expandData;
  RouterGroup({
    this.title,
    this.description,
    this.icon,
    this.expandData,
  }) {
    assert(title != null);
    assert(icon != null);
    assert(expandData != null);
  }
}

class RouterData {
  final String title;
  final String description;
  bool selected;
  PreviewWidgetFactory preview;
  IntroduceWidgetFactory introduce;
  String code;
  RouterData(
      {@required this.title,
      this.description,
      this.selected = false,
      @required this.preview,
      @required this.introduce,
      @required this.code}) {
    assert(title != null);
    assert(preview != null);
    assert(introduce != null);
    assert(code != null);
  }
}

List<RouterGroup> widgetRouter = [
  RouterGroup(title: "Text", icon: Icons.text_fields, expandData: <RouterData>[
    RouterData(
      title: "Text",
      preview: () => Text("Preview"),
      introduce: () => Text("Introduct"),
      code: "",
    )
  ]),
  RouterGroup(
      title: "Animation",
      icon: Icons.rotate_right,
      expandData: <RouterData>[
        RouterData(
          title: "Simple Animation",
          preview: () => SimpleAnimationPreview(),
          introduce: () => SimpleAnimationIntroduce(),
          code: "lib/app/widget/animation/simple_animation_run.dart",
        ),
        RouterData(
          title: "Route Animation",
          preview: () => RouteAnimationPreview(),
          introduce: () => RouteAnimationIntroduce(),
          code: "lib/app/widget/animation/route_animation_run.dart",
        ),
        RouterData(
          title: "Hero Animation",
          preview: () => HeroAnimationPreview(),
          introduce: () => HeroAnimationIntroduce(),
          code: "lib/app/widget/animation/hero_animation_run.dart",
        )
      ])
];
