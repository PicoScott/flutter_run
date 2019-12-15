import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:markdown/markdown.dart' as markdown;

class MarkdownView extends StatelessWidget {
  final String data;
  MarkdownView(this.data);
  @override
  Widget build(BuildContext context) {
    return HtmlView(data: markdown.markdownToHtml(data == null ? "" : data));
  }
}