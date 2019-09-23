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
    super.initState();
    _controller = new AnimationController(
        vsync: this,
        duration: new Duration(seconds: 4));
    Tween tween = new Tween<double>(begin: 10.0, end: 180.0);
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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.white,
        child: new Stack(
          children: <Widget>[
            new Positioned(
                child: new Material(
                    child: new Icon(Icons.airport_shuttle,
                        textDirection: TextDirection.ltr,
                        size: 81.0
                    )
                ),
                left: _animation.value, // Animated value
                top: 30.0  // Fixed value
            )
          ],
          textDirection: TextDirection.ltr,)
    );
  }
}