import 'package:catalog_app/domain/model/offer.dart';

class CartItem {
  final int _id;
  final String _title;
  final String _image;
  final int _offerId;
  final int _count;
  final double _price;

  int get id => _id;
  String get image => _image;
  String get title => _title;
  int get offerId => _offerId;
  int get count => _count;
  double get price => _price;

  CartItem(
      this._id,
      this._title,
      this._image,
      this._offerId,
      this._count,
      this._price
      );

  CartItem.fromOffer(Offer offer):
    _id = null,
    _title = offer.title,
    _image = offer.image,
    _offerId = offer.id,
    _count = 1,
    _price = offer.price;
}