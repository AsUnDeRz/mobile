import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SpinKitRotatingCircle(
      color: Colors.lightBlueAccent,
      size: 50.0,
    );
  }
}

class LoaderPageStandart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}