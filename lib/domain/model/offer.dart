import 'package:catalog_app/domain/model/seller.dart';

class Offer {

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

  Offer(
      this._id,
      this._title,
      this._image,
      this._gallery,
      this._category,
      this._price,
      this._description,
      this._characters,
      this._seller);
}