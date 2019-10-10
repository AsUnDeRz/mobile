import 'package:catalog_app_bloc/data/api/mapping/api_seller_mapper.dart';
import 'package:catalog_app_bloc/domain/model/seller.dart';

class ApiOffer {
  static const ID = 'offer_id';
  static const TITLE = 'offer_title';
  static const IMAGE = 'offer_image';
  static const GALLERY = 'offer_gallery';
  static const PRICE = 'offer_price';
  static const DESCRIPTION = 'offer_description';
  static const CATEGORY = 'offer_category';
  static const CHARACTERS = 'offer_characters';
  static const SELLER = 'seller';

  final int _id;
  final String _title;
  final String _image;
  final List _gallery;
  final String _category;
  final String _description;
  final double _price;
  final Map _characters;
  final Seller _seller;

  int get id => _id;
  String get title => _title;
  String get image => _image;
  List get gallery => _gallery;
  String get category => _category;
  String get description => _description;
  double get price => _price;
  Map get characters => _characters;
  Seller get seller => _seller;

  ApiOffer(
      this._id,
      this._title,
      this._image,
      this._gallery,
      this._category,
      this._price,
      this._description,
      this._characters,
      this._seller);

  ApiOffer.fromMap(dynamic map):
        _id = map [ID] ,
        _title = map[TITLE],
        _image = map [IMAGE],
        _gallery = map [GALLERY],
        _price = map [PRICE],
        _description = map [DESCRIPTION],
        _category = map [CATEGORY],
        _characters = map [CHARACTERS],
        _seller = ApiSellerMapper.toSeller(map [SELLER]);
}