import 'package:flutter/material.dart';

import 'circle_avatar_widget.dart';


class AvatarWidget extends StatelessWidget {
  final String avatarUrl;
  final String imagePath;
  final double radius;
  final Widget placeholder;
  final Widget error;
  final BoxDecoration decoration;

  const AvatarWidget({
    Key key,
    this.avatarUrl,
    this.imagePath,
    this.radius,
    this.placeholder,
    this.error,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        return CircleAvatarWidget(
          avatarUrl: avatarUrl,
          imagePath: imagePath,
          radius: radius ?? constraints.maxWidth/2,
          placeholder: placeholder,
          error: error,
          decoration: decoration,
        );
      },
    );
  }
}