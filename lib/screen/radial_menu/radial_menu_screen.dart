
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' show radians;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


// The stateful widget + animation controller
class RadialMenuScreen extends StatefulWidget {
  createState() => _RadialMenuScreenState();
}

class _RadialMenuScreenState extends State<RadialMenuScreen> with SingleTickerProviderStateMixin {

  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(duration: Duration(milliseconds: 900), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RadialAnimation(controller: controller);
  }

}

class RadialAnimation extends StatelessWidget {
  RadialAnimation({ Key key, this.controller }) :

        scale = Tween<double>(
          begin: 1.5,
          end: 0.0,
        ).animate(
          CurvedAnimation(
              parent: controller,
              curve: Curves.fastOutSlowIn
          ),
        ),


        translation = Tween<double>(
          begin: 0.0,
          end: 100.0,
        ).animate(
          CurvedAnimation(
              parent: controller,
              curve: Curves.linear
          ),
        ),

        rotation = Tween<double>(
          begin: 0.0,
          end: 360.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.3, 0.9,
              curve: Curves.decelerate,
            ),
          ),
        ),

        super(key: key);

  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> translation;
  final Animation<double> rotation;


  build(context) {
    return Container(
      color: Colors.white,
      child: AnimatedBuilder(
          animation: controller,
          builder: (context, builder) {
            return Transform.rotate(
              angle: radians(rotation.value),
              child: Stack(
                  alignment: Alignment.center,
                  children: [
                    _buildButton(0, color: Colors.red, icon: FontAwesomeIcons.thumbtack),
                    _buildButton(45, color: Colors.green, icon:FontAwesomeIcons.sprayCan),
                    _buildButton(90, color: Colors.orange, icon: FontAwesomeIcons.fire),
                    _buildButton(135, color: Colors.blue, icon:FontAwesomeIcons.kiwiBird),
                    _buildButton(180, color: Colors.black, icon:FontAwesomeIcons.cat),
                    _buildButton(225, color: Colors.indigo, icon:FontAwesomeIcons.paw),
                    _buildButton(270, color: Colors.pink, icon: FontAwesomeIcons.bong),
                    _buildButton(315, color: Colors.yellow, icon:FontAwesomeIcons.bolt),
                    Transform.scale(
                      scale: scale.value - 1.5, // subtract the beginning value to run the opposite animation
                      child: FloatingActionButton(
                          heroTag: "btn${Random().nextInt(400000)}",
                          child: Icon(FontAwesomeIcons.timesCircle),
                          onPressed: _close,
                          backgroundColor: Colors.red
                      ),
                    ),

                    Transform.scale(
                      scale: scale.value,
                      child: FloatingActionButton(
                          heroTag: "btn${Random().nextInt(400000)}",
                          child:
                          Icon(FontAwesomeIcons.solidDotCircle),
                          onPressed: _open
                      ),
                    )
                  ]),
            );
          }),
    );
  }

  _buildButton(double angle, { Color color, IconData icon }) {
    final double rad = radians(angle);
    return Transform(
        transform: Matrix4.identity()..translate(
            (translation.value) * cos(rad),
            (translation.value) * sin(rad)
        ),

        child: FloatingActionButton(
          heroTag: "btn${Random().nextInt(400000)}",
            child: Icon(icon), backgroundColor: color, onPressed: _close, elevation: 0)
    );
  }

  _open() {
    controller.forward();
  }

  _close() {
    controller.reverse();
  }
}