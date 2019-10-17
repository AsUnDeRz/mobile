import 'package:flutter/material.dart';

import 'package:animation_app/screen/loading_button/progress_button/reveal_progress_button.dart';

class LoadingButton extends StatefulWidget {
  LoadingButton({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
          child: RevealProgressButton(),
        ),
      ),
    );
  }
}
