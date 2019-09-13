import 'dart:convert';

class Offer {
  static const OFFER_ID = 'offer_id';
  static const OFFER_TITLE = 'offer_title';
  static const OFFER_IMAGE = 'offer_image';
  static const OFFER_PRICE = 'offer_price';
  static const OFFER_DESCRIPTION = 'offer_description';
  static const OFFER_CATEGORY = 'offer_category';
  static const OFFER_CHARACTERS = 'offer_characters';
  static const OFFER_SELLER = 'seller_id';



  final int _id;
  final String _title;
  final String _image;
  final String _category;
  final String _description;
  final double _price;
  final Map _characters;
  final int _sellerId;

  int get id => _id;
  String get title => _title;
  String get image => _image;
  String get category => _category;
  String get description => _description;
  double get price => _price;
  Map get characters => _characters;
  int get sellerId => _sellerId;

  Offer(
      this._id,
      this._title,
      this._image,
      this._category,
      this._price,
      this._description,
      this._characters,
      this._sellerId);

  Offer.fromMap(dynamic map) :
        _id = map [OFFER_ID],
        _title = map[OFFER_TITLE],
        _image = map [OFFER_IMAGE],
        _price = map [OFFER_PRICE],
        _description = map [OFFER_DESCRIPTION],
        _category = map [OFFER_CATEGORY],
        _characters = jsonDecode(map [OFFER_CHARACTERS]),
        _sellerId = map [OFFER_SELLER];

  toMap() => {
    OFFER_ID : id,
    OFFER_TITLE : title,
    OFFER_IMAGE : image,
    OFFER_PRICE : price,
    OFFER_DESCRIPTION : description,
    OFFER_CATEGORY : category,
    OFFER_CHARACTERS : jsonEncode(characters),
    OFFER_SELLER : sellerId,
  };
}