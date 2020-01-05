import 'package:drafts/screen/circle_avatar/avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:snappable/snappable.dart';

class ThanosSnapScreen extends StatelessWidget {
  final key1 = GlobalKey<SnappableState>();
  final key2 = GlobalKey<SnappableState>();
  final key3 = GlobalKey<SnappableState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: PageView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Snappable(
                  duration: Duration(seconds: 1),
                  key: key1,
                  snapOnTap: true,
                  child: Container(
                    color: Colors.cyan,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: AvatarWidget(
                            imagePath: "assets/test-avatar/avatar1.jpg",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Snappable(
                  duration: Duration(seconds: 1),
                  key: key2,
                  snapOnTap: true,
                  child: Container(
                    color: Colors.black54,
                    child: Row(
                      children: <Widget>[
                        Spacer(),
                        Expanded(
                          child: AvatarWidget(
                            imagePath: "assets/test-avatar/avatar2.jpg",
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Snappable(
                  duration: Duration(seconds: 1),
                  key: key3,
                  snapOnTap: true,
                  child: Container(
                    color: Colors.deepPurple,
                    child: Row(
                      children: <Widget>[
                        Spacer(flex: 2),
                        Expanded(
                          child: AvatarWidget(
                            imagePath: "assets/test-avatar/avatar3.jpg",
                          ),
                        ),
                        Spacer(flex: 2),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}