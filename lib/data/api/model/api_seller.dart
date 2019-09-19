
class ApiSeller{
  static const ID = 'seller_id';
  static const NAME = 'seller_name';
  static const IMAGE = 'seller_image';
  static const TYPE = 'seller_type';
  static const INFO = 'seller_info';

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

  ApiSeller(
      this._id,
      this._name,
      this._image,
      this._type,
      this._info,
      );

  ApiSeller.fromMap(dynamic map):
        _id = map [ID],
        _name = map[NAME],
        _image = map[IMAGE],
        _type = map[TYPE],
        _info = map[INFO];
}