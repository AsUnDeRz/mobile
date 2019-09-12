import 'dart:convert';
import 'dart:math';

import 'package:catalog_app/domain/model/cart_item.dart';
import 'package:catalog_app/domain/model/seller.dart';
import 'package:catalog_app/domain/model/offer.dart';

import 'package:catalog_app/data/db/db_demo_config.dart';

class CartScheme {
  static final String tableId = 'cart_table';
  static final String columnId= CartItem.CART_ITEM_ID;
  static final String columnTitle= CartItem.CART_ITEM_TITLE;
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
  static final String columnId = Offer.ID;
  static final String columnTitle = Offer.TITLE;
  static final String columnImage = Offer.IMAGE;
  static final String columnPrice = Offer.PRICE;
  static final String columnDescription = Offer.DESCRIPTION;
  static final String columnCategory = Offer.CATEGORY;
  static final String columnCharacters = Offer.CHARACTERS;
  static final String columnSeller = Offer.SELLER;

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



  static String fillTableDemo() {
    String sql="insert into offer_table ( ${Offer.ID}, ${Offer.TITLE}, ${Offer.IMAGE}, ${Offer.PRICE}, ${Offer.DESCRIPTION},"
        " ${Offer.CATEGORY}, ${Offer.CHARACTERS}, ${Offer.SELLER}) values ";

    Random rnd= Random();

    for(int i = 0; i != DbDemoConfig.countGoods; ++i) {
      int numberPicture = 1 + rnd.nextInt(4 - 1);
      int idSeller = 1+rnd.nextInt(3);
      int price= 100 + rnd.nextInt(1000 - 100);
      var characters= {
        'Test-key1': 'test-value1',
        'Test-key2': 'test-value2',
        'Test-key3': 'test-value3',
        'Test-key4': 'test-value4',
      };
      int idCategory = 1 + rnd.nextInt(5 - 1);
      sql+="""
        (null,'Good $i', 'assets/images/good$numberPicture.jpg', $price,
        'С другой стороны, повышение уровня гражданского сознания, а также свежий взгляд на привычные вещи - безусловно открывает новые горизонты для благоприятных перспектив. С другой стороны, существующая теория не даёт нам иного выбора, кроме определения анализа существующих паттернов поведения.'
        , 'category$idCategory', '${jsonEncode(characters)}', $idSeller)
        """;
      sql+=(i==DbDemoConfig.countGoods-1)?'':',';
    }
    return sql;
  }

}

class SellerScheme {
  static final String tableId = 'seller_table';
  static final String columnId= Seller.ID;
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
    String sql='insert into seller_table (seller_id, seller_name, seller_image, seller_type, seller_info) values ';

    Random rnd= Random();

    for(int i=1; i<=3; ++i) {
      List names = ['John','Shon','Johan'];
      List type = ['company','public'];
      int numberType = rnd.nextInt(2);
      sql+="""
        (null, '${names[i-1]}', 'assets/images/seller$i.jpg', '${type[numberType]}', 'Info $i')
        """;
      sql+=(i==3)?';':',';
    }

    return sql;
  }
}