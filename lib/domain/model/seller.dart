
class Seller {
  static const ID = 'seller_id';
  static const NAME = 'seller_name';
  static const IMAGE = 'seller_image';
  static const TYPE = 'seller_type';
  static const INFO = 'seller_info';

  final String _name;
  final String _image;
  final String _type;
  final String _info;

  String get name => _name;
  String get image => _image;
  String get type => _type;
  String get info => _info;

  Seller(
      this._name,
      this._image,
      this._type,
      this._info,
      );

  Seller.fromMap(dynamic map):
        _name = map[NAME],
        _image = map[IMAGE],
        _type = map[TYPE],
        _info = map[INFO];
}