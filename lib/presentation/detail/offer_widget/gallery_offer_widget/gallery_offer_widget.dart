import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:catalog_app/presentation/design/application_design.dart';

import 'gallery_photo_view_wrapper.dart';

class GalleryOfferWidget extends StatefulWidget {
  final List galleryImages;

  GalleryOfferWidget(this.galleryImages);

  @override
  _GalleryOfferWidgetState createState() => _GalleryOfferWidgetState();
}

class _GalleryOfferWidgetState extends State<GalleryOfferWidget> {

  _GalleryOfferWidgetState();

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(
        builder: (context, constraint) {
          return Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.galleryImages.length,
              itemBuilder: (BuildContext context, int index) =>
                  _getGalleryImage(index, constraint),
            ),
          );
        }
      );

  Widget _getGalleryImage(index, BoxConstraints constraint) =>
      Container(
        width: constraint.maxWidth * .5,
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: GestureDetector(
            onTap: () => _onOpenGallery(index),
            child: Hero(
              tag: widget.galleryImages[index],
              child: CachedNetworkImage(
                placeholder: (context, url) => LoaderPage(),
                imageUrl: widget.galleryImages[index],
                errorWidget: (_, __, ___,) => Text('Error', style: TextStyle(color: Colors.red),),
              ),
            ),
          ),
      );

  void _onOpenGallery( final int index) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            GalleryPhotoViewWrapper(
              galleryItems: widget.galleryImages,
              backgroundDecoration: const BoxDecoration(
                  color: Colors.black
              ),
              initialIndex: index,
            ),
      ),
    );
}