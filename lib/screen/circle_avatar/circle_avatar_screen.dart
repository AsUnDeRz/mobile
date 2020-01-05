import 'package:drafts/screen/circle_avatar/avatar_widget.dart';
import 'package:flutter/material.dart';

class CircleAvatarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: PageView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
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
          Container(
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
          Container(
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
        ],
      ),
    );
  }
}