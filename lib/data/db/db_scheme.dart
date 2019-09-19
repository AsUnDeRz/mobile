import 'package:catalog_app/data/db/db_demo.dart';
import 'package:catalog_app/data/db/model/db_offer.dart';
import 'package:catalog_app/data/db/model/db_seller.dart';
import 'package:catalog_app/data/db/model/db_cart_item.dart';

class CartScheme {
  static final String tableId = 'cart_table';
  static final String columnId = DbCartItem.ID;
  static final String columnTitle = DbCartItem.TITLE;
  static final String columnImage = DbCartItem.IMAGE;
  static final String columnOfferId = DbCartItem.OFFER_ID;
  static final String columnCount = DbCartItem.COUNT;
  static final String columnPrice = DbCartItem.PRICE;

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
  static final String columnId = DbOffer.ID;
  static final String columnTitle = DbOffer.TITLE;
  static final String columnImage = DbOffer.IMAGE;
  static final String columnPrice = DbOffer.PRICE;
  static final String columnDescription = DbOffer.DESCRIPTION;
  static final String columnCategory = DbOffer.CATEGORY;
  static final String columnCharacters = DbOffer.CHARACTERS;
  static final String columnSeller = DbOffer.SELLER_ID;

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
  static final String columnId = DbSeller.ID;
  static final String columnName = DbSeller.NAME;
  static final String columnImage = DbSeller.IMAGE;
  static final String columnType = DbSeller.TYPE;
  static final String columnInfo = DbSeller.INFO;

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
