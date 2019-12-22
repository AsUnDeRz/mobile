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
    _controller = AnimationController(vsync: this,
        duration: Duration(seconds: 6));
    _controller.repeat();
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
          child: ScaleTransition(
              scale: _controller,
              child: Text("\u{1F43A}",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 85.0),),
          )
      ),
    );
  }
}