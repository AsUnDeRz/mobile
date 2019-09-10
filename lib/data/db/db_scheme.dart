import 'dart:convert';
import 'dart:math';

import 'package:catalog_app/domain/model/cart_item.dart';
import 'package:catalog_app/domain/model/seller.dart';
import 'package:catalog_app/domain/model/offer.dart';

import 'package:catalog_app/data/db/db_demo_config.dart';

class CartScheme {
  static final String tableId = 'cart_table';
  static final String columnId= CartItem.ID;
  static final String columnTitle = CartItem.TITLE;
  static final String columnImage = CartItem.IMAGE;
  static final String columnPrice = CartItem.PRICE;

  static String getCreateSql() {
    return ''' 
    create table
    $tableId (
    $columnId integer primary key autoincrement,
    $columnTitle text not null,
    $columnImage text not null,
    $columnPrice double not null)
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
    $columnDescription real not null,
    $columnCategory text not null,
    $columnCharacters text not null,
    $columnSeller integer not null,
    )
    ''';
  }



  static String fillTableDemo() {
    String sql='insert into offer_table(id, title, image, price, description, category, characters, seller_id) value';

    Random rnd= Random();

    for(int i=0; i!=DbDemoConfig.countGoods; ++i) {
      int numberPicture = 1 + rnd.nextInt(3 - 1);
      int price= 100 + rnd.nextInt(1000 - 100);
      Map <String, String> characters= {
        'Test-key1':'test-value1',
        'Test-key2':'test-value2',
        'Test-key3':'test-value3',
        'Test-key4':'test-value4',
      };
      int idCategory = 1 + rnd.nextInt(5 - 1);
      sql+="""
        (,'Good $i', 'assets/images/good$numberPicture.jpg', $price,
        'Задача организации, в особенности же курс на социально-ориентированный
        национальный проект прекрасно подходит для реализации позиций,
        занимаемых участниками в отношении поставленных задач. Значимость
        этих проблем настолько очевидна, что понимание сути ресурсосберегающих
        технологий влечет за собой процесс внедрения и модернизации прогресса
        профессионального сообщества.', 'category$idCategory', '${jsonEncode(characters)}', $i,)
        """;
      sql+=(i==DbDemoConfig.countGoods-1)?';':',';
    }

    return sql;
  }

}

class SellerScheme {
  static final String tableId = 'seller_table';
  static final String columnId= Seller.ID;
  static final String columnName = Seller.NAME;
  static final String columnType = Seller.TYPE;
  static final String columnInfo = Seller.INFO;

  static String getCreateSql() {
  return ''' 
    create table
    $tableId (
    $columnId integer primary key autoincrement,
    $columnName text not null,
    $columnType text not null,
    $columnInfo double not null)
    ''';
  }

  static String fillTableDemo() {
    String sql='insert into seller_table(id, name, image, type, info) value';

    Random rnd= Random();

    for(int i=0; i!=DbDemoConfig.countGoods; ++i) {
      int numberName = 1 + rnd.nextInt(3 - 1);
      List names= ['John','Shon','Johan'];

      int numberType = 1 + rnd.nextInt(2 - 1);
      List type= ['company','public'];
      sql+="""
        (,'${names[numberName]}', 'assets/images/seller$numberName.jpg', '${type[numberType]}', 'Info $i' )
        """;
      sql+=(i==DbDemoConfig.countGoods-1)?';':',';
    }

    return sql;
  }
}