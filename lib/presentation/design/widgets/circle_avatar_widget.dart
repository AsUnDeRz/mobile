import 'dart:io';

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class CircleAvatarWidget extends StatelessWidget {
  final String avatarUrl;
  final String imagePath;
  final double radius;
  final Widget placeholder;
  final Widget error;
  final BoxDecoration decoration;

  const CircleAvatarWidget({
    this.avatarUrl,
    this.imagePath,
    this.radius,
    this.placeholder,
    this.error,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    double _radius = radius ?? 20.0;
//    if (imagePath == '') {
//      return ClipRAvatar(
//        radius: _radius,
//        image: _getDefaultAvatar(_radius),
//        decoration: decoration,
//      );
//    }
//
//    if (imagePath != null) {
//      return ClipRAvatar(
//        radius: _radius,
//        decoration: decoration,
//        image: Image.file(
//          File(imagePath),
//        ),
//      );
//    }

    if (avatarUrl == '' || avatarUrl == null) {
      Widget defaultImage = _getDefaultAvatar(_radius);

      if(decoration != null) {
        if (decoration.border.bottom.color == Colors.white) {
          return ClipRAvatar(
            radius: _radius,
            image: defaultImage,
          );
        }
      }
      return ClipRAvatar(
        radius: _radius,
        image: defaultImage,
        decoration: decoration,
      );
    }
    return CachedNetworkImage(
      useOldImageOnUrlChange: true,
      imageUrl: avatarUrl,
//      placeholderFadeInDuration: Duration(seconds: 2),
//      fadeInDuration: Duration(seconds: 2),
//      fadeOutDuration: Duration(seconds: 2),
      imageBuilder: (context, imageProvider) {
        return ClipRAvatar(
          radius: _radius,
          image: Image(
            gaplessPlayback: true,
            image: imageProvider,
            fit: BoxFit.cover,
            width: _radius * 2,
          ),
          decoration: decoration,
        );
      },
//      placeholder: (_, __) {
//        Widget defaultImage = _getDefaultAvatar(_radius);
//        return ClipRAvatar(
//          radius: _radius,
//          image: placeholder ?? defaultImage,
//          decoration: decoration,
//        );
//      },
      errorWidget: (_, __, ___) {
        Widget defaultImage = _getDefaultAvatar(_radius);
        return ClipRAvatar(
          radius: _radius,
          image: error ?? defaultImage,
          decoration: decoration,
        );
      },
    );
  }

  Widget _getDefaultAvatar(double radius){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle
      ),
      child: Padding(
        padding: EdgeInsets.all(radius/4),
        child: Image.asset(
          "assets/images/default_avatar.png",
        ),
      ),
    );
  }
}

class ClipRAvatar extends StatelessWidget {
  final double radius;
  final Widget image;
  final BoxDecoration decoration;

  const ClipRAvatar({Key key, this.radius, this.image, this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _radius = radius ?? 20;
    Widget defaultImage = Image.asset(
      "assets/test-avatar/avatar3.jpg",
      fit: BoxFit.cover,
    );
    return Container(
      height: _radius * 2,
      width: _radius * 2,
      decoration: decoration,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(_radius),
          child: image ?? defaultImage),
    );
  }
}
