import 'package:flutter/material.dart';
import 'package:flutter_run/app/widget/animation/hero_animation_run.dart';
import 'package:flutter_run/app/widget/animation/route_animation_run.dart';
import 'package:flutter_run/app/widget/animation/simple_animation_run.dart';
import 'package:flutter_run/app/widget/layout/row_run.dart';

import 'layout/column_run.dart';
import 'layout/flex_run.dart';

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
  Widget preview;
  Widget introduce;
  String code;
  RouterData({
    @required this.title,
    @required this.preview,
    @required this.code,
    this.description,
    this.selected = false,
    this.introduce,
  }) {
    assert(title != null);
    assert(preview != null);
    assert(code != null);
  }
}

List<RouterGroup> widgetRouter = [
  RouterGroup(title: "Text", icon: Icons.text_fields, expandData: <RouterData>[
    RouterData(
      title: "Text",
      preview: Text("Preview"),
      code: "",
    )
  ]),
  RouterGroup(title: "Layout", icon: Icons.subject, expandData: <RouterData>[
    RouterData(
      title: "Flex",
      preview: FlexPreview(),
      introduce: flexIntroduce,
      code: "lib/app/widget/layout/flex_run.dart",
    ),
    RouterData(
      title: "Row",
      preview: RowPreview(),
      code: "lib/app/widget/layout/row_run.dart",
      introduce: rowIntroduce,
    ),
    RouterData(
      title: "Column",
      preview: ColumnPreview(),
      code: "lib/app/widget/layout/column_run.dart",
    ),
  ]),
  RouterGroup(
      title: "Animation",
      icon: Icons.rotate_right,
      expandData: <RouterData>[
        RouterData(
          title: "Simple Animation",
          preview: SimpleAnimationPreview(),
          code: "lib/app/widget/animation/simple_animation_run.dart",
        ),
        RouterData(
          title: "Route Animation",
          preview: RouteAnimationPreview(),
          code: "lib/app/widget/animation/route_animation_run.dart",
        ),
        RouterData(
          title: "Hero Animation",
          preview: HeroAnimationPreview(),
          code: "lib/app/widget/animation/hero_animation_run.dart",
        ),
      ]),
];
