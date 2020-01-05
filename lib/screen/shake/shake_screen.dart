import 'package:flutter/material.dart';

import 'package:drafts/screen/circle_avatar/avatar_widget.dart';
import 'package:shake/shake.dart';
import 'package:vibration/vibration.dart';

class ShakeScreen extends StatefulWidget {

  @override
  _ShakeScreenState createState() => _ShakeScreenState();
}

class _ShakeScreenState extends State<ShakeScreen> {
  ShakeDetector detector;
  PageController pageController = PageController();

  @override
  void initState() {
    detector = ShakeDetector.autoStart(
        onPhoneShake: () {
          pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeInCubic);
          Vibration.vibrate(duration: 1000);
        }
    );
    super.initState();
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: PageView(
        controller: pageController,
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