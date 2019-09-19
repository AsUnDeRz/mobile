
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
}