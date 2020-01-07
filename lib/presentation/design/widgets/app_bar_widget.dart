import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final Widget child;

  const AppBarWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 50 + MediaQuery.of(context).viewPadding.top,
        color: Colors.black.withOpacity(.35),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: MediaQuery.of(context).viewPadding.top,
              left: 0,
              right: 0,
              child: Container(
                height: 50,
                  child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}