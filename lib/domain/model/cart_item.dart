
class CartItem {

  static const CART_ITEM_ID = 'cart_item_id';
  static const CART_ITEM_TITLE = 'cart_item_title';
  static const CART_ITEM_IMAGE = 'cart_item_image';
  static const OFFER_ID = 'offer_id';
  static const CART_ITEM_COUNT = 'cart_item_count';
  static const CART_ITEM_PRICE = 'cart_item_price';

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


  CartItem(this._id, this._title, this._image, this._offerId, this._count, this._price);

  CartItem.fromMap(dynamic map) :
    _id = map [CART_ITEM_ID],
    _title = map [CART_ITEM_TITLE],
    _image = map [CART_ITEM_IMAGE],
    _offerId = map [OFFER_ID],
    _count = map [CART_ITEM_COUNT],
    _price = map [CART_ITEM_PRICE];

  toMap() => {
    CART_ITEM_ID: _id,
    CART_ITEM_TITLE : _title,
    CART_ITEM_IMAGE : _image,
    OFFER_ID : _offerId,
    CART_ITEM_COUNT : _count,
    CART_ITEM_PRICE : _price,
  };
}