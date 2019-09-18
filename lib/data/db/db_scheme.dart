import 'package:catalog_app/data/db/db_demo.dart';
import 'package:catalog_app/data/db/model/offerDb.dart';
import 'package:catalog_app/domain/model/cart_item.dart';
import 'package:catalog_app/domain/model/seller.dart';

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
  static final String columnId = OfferDb.OFFER_ID;
  static final String columnTitle = OfferDb.OFFER_TITLE;
  static final String columnImage = OfferDb.OFFER_IMAGE;
  static final String columnPrice = OfferDb.OFFER_PRICE;
  static final String columnDescription = OfferDb.OFFER_DESCRIPTION;
  static final String columnCategory = OfferDb.OFFER_CATEGORY;
  static final String columnCharacters = OfferDb.OFFER_CHARACTERS;
  static final String columnSeller = OfferDb.OFFER_SELLER_ID;

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
  static final String columnId = Seller.SELLER_ID;
  static final String columnName = Seller.SELLER_NAME;
  static final String columnImage = Seller.SELLER_IMAGE;
  static final String columnType = Seller.SELLER_TYPE;
  static final String columnInfo = Seller.SELLER_INFO;

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
