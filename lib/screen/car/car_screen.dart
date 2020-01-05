import 'package:flutter/material.dart';

class CarScreen extends StatefulWidget {
  @override
  _CarScreenState createState() =>  _CarScreenState();
}

class _CarScreenState extends State<CarScreen> with SingleTickerProviderStateMixin {

  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 4));
    Tween tween = Tween<double>(begin: 10.0, end: 180.0);
    _animation = tween.animate(_controller);
    _animation.addListener(() {
      setState(() {

      });
    });
    _controller.forward();
    _animation.addStatusListener((status) {
      if(status == AnimationStatus.completed)
        _controller.reverse();
      else if(status == AnimationStatus.dismissed)
        _controller.forward();
    });
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
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Material(
              child: Icon(
                Icons.airport_shuttle,
                textDirection: TextDirection.rtl,
                size: 80.0,
              ),
            ),
            left: _animation.value, // Animated value
            top: MediaQuery
                .of(context)
                .size
                .height / 2 - 40, // Fixed value
          ),
        ],
        textDirection: TextDirection.ltr,
      ),
    );
  }
}