
class CartItem {

  static const ID = 'cart_item_id';
  static const TITLE = 'cart_item_title';
  static const IMAGE = 'cart_item_image';
  static const OFFER_ID = 'offer_id';
  static const COUNT = 'cart_item_count';
  static const PRICE = 'cart_item_price';

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

  CartItem.fromMap(dynamic map) :
    _id = map [ID],
    _title = map [TITLE],
    _image = map [IMAGE],
    _offerId = map [OFFER_ID],
    _count = map [COUNT],
    _price = map [PRICE];

  toMap() => {
    ID: _id,
    TITLE : _title,
    IMAGE : _image,
    OFFER_ID : _offerId,
    COUNT : _count,
    PRICE : _price,
  };
}