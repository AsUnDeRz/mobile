import 'dart:convert';

class DbOffer {
  static const ID = 'offer_id';
  static const TITLE = 'offer_title';
  static const IMAGE = 'offer_image';
  static const GALLERY = 'offer_gallery';
  static const PRICE = 'offer_price';
  static const DESCRIPTION = 'offer_description';
  static const CATEGORY = 'offer_category';
  static const CHARACTERS = 'offer_characters';
  static const SELLER_ID = 'seller_id';

  final int _id;
  final String _title;
  final String _image;
  final List _gallery;
  final String _category;
  final String _description;
  final double _price;
  final Map _characters;
  final int _sellerId;

  int get id => _id;
  String get title => _title;
  String get image => _image;
  List get gallery => _gallery;
  String get category => _category;
  String get description => _description;
  double get price => _price;
  Map get characters => _characters;
  int get sellerId => _sellerId;

 DbOffer(
      this._id,
      this._title,
      this._image,
      this._gallery,
      this._category,
      this._price,
      this._description,
      this._characters,
      this._sellerId);

  DbOffer.fromMap(dynamic map):
        _id = map [ID],
        _title = map[TITLE],
        _image = map [IMAGE],
        _gallery = jsonDecode(map [GALLERY]),
        _price = map [PRICE],
        _description = map [DESCRIPTION],
        _category = map [CATEGORY],
        _characters = jsonDecode(map [CHARACTERS]),
        _sellerId = map [SELLER_ID];

  toMap() => {
    ID: id,
    TITLE: title,
    IMAGE: image,
    GALLERY: jsonEncode(gallery),
    CATEGORY: category,
    DESCRIPTION: description,
    CHARACTERS: jsonEncode(characters),
    PRICE: price,
    SELLER_ID: sellerId,
  };
}