import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:catalog_app/presentation/design/application_design.dart';

class CardOfferImage extends StatelessWidget {

  final String _image;
  final double _height;

  CardOfferImage(this._image, this._height);

  @override
  Widget build(BuildContext context) =>
      CachedNetworkImage(
        placeholder: (context, url) => LoaderPage(),
        imageUrl: _image,
        fit: BoxFit.fill,
        height: _height,
      );

}