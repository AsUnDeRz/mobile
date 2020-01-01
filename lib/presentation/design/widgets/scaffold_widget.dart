import 'package:flutter/material.dart';

import 'app_bar_widget.dart';

class ScaffoldWidget extends StatelessWidget {
  final AppBarWidget appBarWidget;
  final Widget body;

  const ScaffoldWidget({Key key, this.appBarWidget, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        body,
        appBarWidget
      ],
    );
  }
}