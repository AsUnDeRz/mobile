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
    _controller = AnimationController(vsync: this,
        duration: Duration(seconds: 6));
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: RotationTransition(
              turns: _controller,
              child: Text("\u{1F43A}",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 85.0),)
          )
      ),
    );
  }
}