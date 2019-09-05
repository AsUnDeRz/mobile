import 'package:catalog_app/domain/model/seller.dart';

class Offer {
  final String title;
  final String image;
  final String category;
  final String description;
  final double price;
  final Map<String,String> characters;
  final Seller seller;

  Offer(
  this.title,
  this.image,
  this.category,
  this.price,
  this.seller,
  this.description,
  this.characters);
}