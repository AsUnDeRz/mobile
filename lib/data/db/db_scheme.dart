import 'package:catalog_app/data/db/db_demo.dart';
import 'package:catalog_app/domain/model/cart_item.dart';
import 'package:catalog_app/domain/model/seller.dart';
import 'package:catalog_app/domain/model/offer.dart';

class CartScheme {
  static final String tableId = 'cart_table';
  static final String columnId = CartItem.CART_ITEM_ID;
  static final String columnTitle = CartItem.CART_ITEM_TITLE;
  static final String columnImage = CartItem.CART_ITEM_IMAGE;
  static final String columnOfferId = CartItem.OFFER_ID;
  static final String columnCount = CartItem.CART_ITEM_COUNT;
  static final String columnPrice = CartItem.CART_ITEM_PRICE;

  static String getCreateSql() {
    return ''' 
    create table
    $tableId (
    $columnId integer primary key autoincrement,
    $columnTitle text not null,
    $columnImage text not null,
    $columnOfferId integer not null,
    $columnCount integer not null,
    $columnPrice double not null
    )
    ''';
  }
}

class OfferScheme {
  static final String tableId = 'offer_table';
  static final String columnId = Offer.OFFER_ID;
  static final String columnTitle = Offer.OFFER_TITLE;
  static final String columnImage = Offer.OFFER_IMAGE;
  static final String columnPrice = Offer.OFFER_PRICE;
  static final String columnDescription = Offer.OFFER_DESCRIPTION;
  static final String columnCategory = Offer.OFFER_CATEGORY;
  static final String columnCharacters = Offer.OFFER_CHARACTERS;
  static final String columnSeller = Offer.OFFER_SELLER;

  static String getCreateSql() {
    return ''' 
    create table
    $tableId (
    $columnId integer primary key autoincrement,
    $columnTitle text not null,
    $columnImage text not null,
    $columnPrice real not null,
    $columnDescription text not null,
    $columnCategory text not null,
    $columnCharacters text not null,
    $columnSeller integer not null)
    ''';
  }
}

class SellerScheme {
  static final String tableId = 'seller_table';
  static final String columnId = Seller.ID;
  static final String columnName = Seller.NAME;
  static final String columnImage = Seller.IMAGE;
  static final String columnType = Seller.TYPE;
  static final String columnInfo = Seller.INFO;

  static String getCreateSql() {
    return ''' 
    create table
    $tableId (
    $columnId integer primary key autoincrement,
    $columnName text not null,
    $columnImage text not null,
    $columnType text not null,
    $columnInfo text not null)
    ''';
  }

  static String fillTableDemo() {
    return SellerFixture.sqlFillTable;
  }
}
