import 'package:flutter/material.dart';


class CurveScreen extends StatefulWidget {
  @override
  _CurveScreenState createState() =>  _CurveScreenState();
}

class _CurveScreenState extends State<CurveScreen> with SingleTickerProviderStateMixin {

  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 5)
    );

    CurvedAnimation curvedAnimation = CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceOut
    );

    Tween myTween = Tween<double>(begin: 150.0, end: 450.0);
    _animation = myTween.animate(curvedAnimation);

    _animation.addListener(() {
      setState(() {
      });
    });

    _controller.repeat();
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
        children: [
          Positioned(
              child: Text("\u{26BE}",
                textDirection: TextDirection.ltr,
                  style: TextStyle(
                      fontSize: 70.0
                  ),
              ),
              left: 50.0,
              top: _animation.value  // Animated property
          ),
        ],
        textDirection: TextDirection.ltr,
      ),
    );
  }
}