
class CartItem {

  static const ID = 'cart_item_id';
  static const TITLE = 'cart_item_title';
  static const IMAGE = 'cart_item_image';
  static const PRICE = 'cart_item_price';

  final int _id;
  final String _title;
  final String _image;
  final double _price;

  CartItem(this._id, this._title, this._image, this._price);

  String get title => _title;

  String get image => _image;

  double get price => _price;

  CartItem.fromMap(dynamic map) :
    _id = map [ID],
    _title = map [TITLE],
    _image = map [IMAGE],
    _price = map [PRICE];

  toMap() => {

    TITLE : _title,
    IMAGE : _image,
    PRICE : _price
  };
}