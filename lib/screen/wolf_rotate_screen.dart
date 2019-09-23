import 'package:flutter/material.dart';

class WolfRotateScreen extends StatefulWidget {
  @override
  _WolfRotateScreenState createState() =>  _WolfRotateScreenState();
}

class _WolfRotateScreenState extends State<WolfRotateScreen> with SingleTickerProviderStateMixin {

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

  Widget build(BuildContext context) {
    return new Center(
        child: new RotationTransition(
            turns: _controller,
            child: new Text("\u{1F43A}",
              textDirection: TextDirection.ltr,
              style: new TextStyle(fontSize: 85.0),)
        )
    );
  }
}