import 'package:flutter/material.dart';

class IconNavigationWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color activeColor;
  final Color color;
  final Color splashColor;
  final bool isActive;
  final void Function() onPressed;

  const IconNavigationWidget({
    Key key,
    this.icon,
    this.label,
    this.activeColor = const Color.fromRGBO(255, 255, 255, 1),
    this.color = const Color.fromRGBO(200, 200, 200, .8),
    this.splashColor = const Color.fromRGBO(0, 0, 0, .6),
    this.isActive = false,
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: (isActive)
                ? activeColor
                : color,
          ),
          Text(label)
        ],
      ),
      splashColor: splashColor,
      onPressed: onPressed,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.zero,
    );
  }
}