import 'package:flutter/material.dart';


class WolfScaleScreen extends StatefulWidget {
  @override
  _WolfScaleScreenState createState() =>  _WolfScaleScreenState();
}

class _WolfScaleScreenState extends State<WolfScaleScreen> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(vsync: this,
        duration: new Duration(seconds: 6));
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new ScaleTransition(
            scale: _controller,
            child: new Text("\u{1F43A}",
              textDirection: TextDirection.ltr,
              style: new TextStyle(fontSize: 85.0),)
        )
    );
  }
}