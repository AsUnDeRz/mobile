import 'dart:math';

import 'package:catalog_app/domain/model/seller.dart';

class SellerFixture{
  static List _names = ['John', 'Shon', 'Johan'];
  static List _typeSeller = ['company', 'public'];

  static Seller get seller => Seller(sellerId, name, image, sellerType, info);
  static String  get sellerType => _typeSeller[Random().nextInt(2)];
  static String  get name =>  _names[Random().nextInt(3)];
  static int  get sellerId => 1 + Random().nextInt(4-1);
  static String  get image => 'assets/images/seller${ 1 + Random().nextInt( 4 - 1 )}.jpg';
  static String  get info  => 'Info ${Random().nextInt(4)}';
  static String  get sqlFillTable  {
    String sql ='insert into seller_table (seller_id, seller_name, seller_image, seller_type, seller_info) values ';

    for (int i = 1; i <= 3; ++i) {
      sql += """
        ($i, '$name', '$image' , '$sellerType', '$info' )
        """;
      sql += (i == 3) ? ';' : ',';
    }

    return sql;
  }
}

class OfferFixture {
  static int countGoods = 20;
  static String get image => 'http://lorempixel.com/1920/1080/?${Random().nextInt(4200000)}';
  static String get category => 'category ${1+Random().nextInt(4-1)}';
  static double get price => 1000.0 * Random().nextDouble();
  static Map get characters => {
        'Test-key1': 'test-value1',
        'Test-key2': 'test-value2',
        'Test-key3': 'test-value3',
        'Test-key4': 'test-value4',
  };
  static int  get idSeller  => SellerFixture.sellerId;
}