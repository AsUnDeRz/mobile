import 'package:flutter/material.dart';
import 'dart:math';

class WolfRotateGestureSetStateScreen extends StatefulWidget {
  @override
  _WolfRotateGestureSetStateScreenState createState() =>  _WolfRotateGestureSetStateScreenState();
}

class _WolfRotateGestureSetStateScreenState extends State<WolfRotateGestureSetStateScreen>  with SingleTickerProviderStateMixin{

  double _step;
  final _valueStep=.05;
  double _rotateMatrix;

  _WolfRotateGestureSetStateScreenState(){
    _step=0;
    _rotateMatrix=0;
  }

  Widget build(BuildContext context) {

    return GestureDetector(
      onPanUpdate: (details) {

        if (details.delta.dx > 0) {
          setState(() {
            _step += _valueStep;
            _rotateMatrix = pi * _step;
          });
        }
        else {
          setState(() {
            _step -= _valueStep;
            _rotateMatrix = pi * _step;
          });
        }
      },
      child: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  color: Colors.lightBlueAccent,
                  child:  Transform.rotate(
                    angle: _rotateMatrix,
                    child: Text("\u{1F43A}",
//                      textDirection: TextDirection.ltr,
                      style: TextStyle(fontSize: 85.0),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: FlatButton(
                    color: Colors.blueAccent,
                    child: Text('Rotate automate'),
                    onPressed: onAutoRotate,
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }

   Future <void> onAutoRotate() async{
    for(var i=1; i<=20; ++i){
      await Future.delayed(Duration(milliseconds: 4));
      setState(() {
        _step+= _valueStep;
        _rotateMatrix=pi*_step;
      });
    }
  }


}