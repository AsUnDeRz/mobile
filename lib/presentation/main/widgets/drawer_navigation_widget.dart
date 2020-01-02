import 'package:flutter/material.dart';

class DrawerNavigationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'User avatar with his nickname and something else useful',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 100),
          child: Row(
            children: <Widget>[
              Spacer(),
              Expanded(
                child: Text(
                  "List of useful buttons with unique functionality",
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}