import 'package:flutter/material.dart';


class WolfFadeScreen extends StatefulWidget {
  @override
  _WolfFadeScreenState createState() =>  _WolfFadeScreenState();
}

class _WolfFadeScreenState extends State<WolfFadeScreen> with SingleTickerProviderStateMixin {

  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween (
      begin: .0,
      end: 1.0,
    ).animate(_controller);
    _animation.addStatusListener((status) {
      if(status == AnimationStatus.completed)
        _controller.reverse();
      else if(status == AnimationStatus.dismissed)
        _controller.forward();
    });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: FadeTransition(
          opacity: _animation,
              child: Text("\u{1F43A}",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 85.0),)
          )
      ),
    );
  }
}