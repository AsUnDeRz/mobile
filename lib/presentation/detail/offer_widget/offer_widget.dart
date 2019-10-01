import 'package:flutter/material.dart';

import 'package:catalog_app/domain/model/offer.dart';
import 'package:catalog_app/presentation/design/application_design.dart';
import 'package:catalog_app/presentation/detail/offer_widget/gallery_offer_widget/gallery_offer_widget.dart';
import 'package:catalog_app/presentation/detail/seller_widget/seller_widget.dart';
import 'package:catalog_app/presentation/detail/offer_widget/category_offer_widget/category_offer_widget.dart';
import 'package:catalog_app/presentation/detail/offer_widget/characters_offer_widget/characters_offer_widget.dart';
import 'package:catalog_app/presentation/detail/offer_widget/description_offer_widget/description_offer_widget.dart';
import 'package:catalog_app/presentation/detail/offer_widget/header_offer_widget/header_offer_widget.dart';

class OfferWidget extends StatelessWidget {
  final Offer _offer;

  OfferWidget(this._offer);

  @override
  Widget build(BuildContext context) => (_offer == null) ? LoaderPage() : _getBody(_offer);

  Widget _getBody(Offer offer){
    List<Widget> listBlocks= [
      HeaderOfferWidget(offer),
      GalleryOfferWidget(offer.gallery),
      DescriptionOfferWidget(offer.description),
      CharactersOfferWidget(offer.characters),
      CategoryOfferWidget(offer.category),
      SellerWidget(offer.seller),
    ];
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        itemCount: listBlocks.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 16.0,
            ),
            child: listBlocks[index],
          );
          },
      ),
    );
  }
}
