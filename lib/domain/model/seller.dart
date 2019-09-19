
class Seller {

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
}