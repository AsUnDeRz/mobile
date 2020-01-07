import 'package:flutter/material.dart';

class CustomNavigationWidget extends StatelessWidget {
  final Widget widget;
  final Color activeColor;
  final Color color;
  final Color splashColor;
  final bool isActive;
  final void Function() onPressed;

  const CustomNavigationWidget({
    Key key,
    this.widget,
    this.activeColor = const Color.fromRGBO(255, 255, 255, 1),
    this.color = const Color.fromRGBO(200, 200, 200, .8),
    this.splashColor = const Color.fromRGBO(0, 0, 0, .6),
    this.isActive = false,
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: widget,
      splashColor: splashColor,
      onPressed: onPressed,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.zero,
    );
  }
}