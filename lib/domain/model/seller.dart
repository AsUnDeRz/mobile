
class Seller {
  static const SELLER_ID = 'seller_id';
  static const SELLER_NAME = 'seller_name';
  static const SELLER_IMAGE = 'seller_image';
  static const SELLER_TYPE = 'seller_type';
  static const SELLER_INFO = 'seller_info';

  final int _id;
  final String _name;
  final String _image;
  final String _type;
  final String _info;

  int get id => _id;
  String get name => _name;
  String get image => _image;
  String get type => _type;
  String get info => _info;

  Seller(
      this._id,
      this._name,
      this._image,
      this._type,
      this._info,
      );

  Seller.fromMap(dynamic map):
        _id = map [SELLER_ID],
        _name = map[SELLER_NAME],
        _image = map[SELLER_IMAGE],
        _type = map[SELLER_TYPE],
        _info = map[SELLER_INFO];
}