import 'package:catalog_app/domain/model/seller.dart';

class Offer {
  static const ID = 'offer_id';
  static const TITLE = 'offer_title';
  static const IMAGE = 'offer_image';
  static const PRICE = 'offer_price';
  static const DESCRIPTION = 'offer_description';
  static const CATEGORY = 'offer_category';
  static const CHARACTERS = 'offer_characters';
  static const SELLER = 'seller_id';



  final int _id;
  final String _title;
  final String _image;
  final String _category;
  final String _description;
  final double _price;
  final Map<String,String> _characters;
  final Seller _seller;

  int get id => _id;

  Offer(
      this._id,
      this._title,
      this._image,
      this._category,
      this._price,
      this._description,
      this._characters,
      this._seller);

  Offer.fromMap(dynamic map) :
        _id = map [ID],
        _title = map [TITLE],
        _image = map [IMAGE],
        _price = map [PRICE];
        _description = map [DESCRIPTION];
        _category = map [CATEGORY];
        _characters = map [CHARACTERS];
        _seller = map [SELLER];

  String get title => _title;

  String get image => _image;

  String get category => _category;

  String get description => _description;

  double get price => _price;

  Map<String, String> get characters => _characters;

  Seller get seller => _seller;

}