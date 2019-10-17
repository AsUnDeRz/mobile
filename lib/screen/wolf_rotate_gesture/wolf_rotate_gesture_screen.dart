import 'package:flutter/material.dart';

class WolfRotateGestureScreen extends StatefulWidget {
  @override
  _WolfRotateGestureScreenState createState() =>  _WolfRotateGestureScreenState();
}

class _WolfRotateGestureScreenState extends State<WolfRotateGestureScreen> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  bool lock;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if(_controller.isAnimating){
          return;
        }
        print(details.delta.dx);
        if (details.delta.dx > 0) {
          _controller.reset();
          _controller.forward();
        }
        else {
          _controller.reverse(from: 1.0);
        }
      },
      child: Container(
        color: Colors.white,
        child: Center(
          child: RotationTransition(
            turns: _controller,
            child: Text("\u{1F43A}",
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 85.0),
            ),
          ),
        ),
      ),
    );
  }
}