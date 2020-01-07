import 'package:flutter/material.dart';

import '../design/application_design.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBarWidget: AppBarWidget(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BackButton(),
            Spacer(),
            Expanded(
              child: Text(
                "User name",
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      body: Container(
        color: Colors.black54
      ),
    );
  }
}