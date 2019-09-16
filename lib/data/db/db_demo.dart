import 'dart:math';
import 'package:catalog_app/internal/dependencies/api_module.dart';
import 'package:catalog_app/domain/model/offer.dart';

class SellerFixture{

  static List _names = ['John', 'Shon', 'Johan'];
  static List _typeSeller = ['company', 'public'];

  static String  get sellerType  {
    Random rnd = Random();
    return _typeSeller[rnd.nextInt(2)];
  }

  static String  get name  {
    Random rnd = Random();
    return _names[rnd.nextInt(3)];
  }

  static int  get sellerId  {
    Random rnd = Random();
    return 1+rnd.nextInt(4-1);
  }

  static String  get image  {
    Random rnd = Random();
    return 'assets/images/seller${1+rnd.nextInt(4-1)}.jpg';
  }

  static String  get info  {
    Random rnd = Random();
    return 'Info ${rnd.nextInt(4)}';
  }

  static String  get sqlFillTable  {
    String sql ='insert into seller_table (seller_id, seller_name, seller_image, seller_type, seller_info) values ';

    for (int i = 1; i <= 3; ++i) {
      sql += """
        (null, '$name', '$image' , '$sellerType', '$info' )
        """;
      sql += (i == 3) ? ';' : ',';
    }

    return sql;
  }
}

class OfferFixture {
  static int countGoods = 20;

  static Future<List<Offer>> get synchronizedOffer async {
    List<String> titles = await synchronizedTitleOffer;
    List<String> descriptions = await synchronizedDescriptionOffer;

    List<Offer> offers = [];

    for (int i = 0; i != countGoods; ++i) {
      offers.add(Offer(
          null,
          titles[i],
          image,
          category,
          price,
          descriptions[i],
          characters,
          idSeller
      ));
    }
    return offers;
  }

  static Future<List<String>> get synchronizedTitleOffer async {
    final api = ApiModule.apiUtil();
    final responseTitles = await api.getFixtureTitle(OfferFixture.countGoods);

    List<String> titles = responseTitles ['text'].split(RegExp(r"\\n\\n"));
    titles.removeLast();
    return titles;
  }

  static Future<List<String>> get synchronizedDescriptionOffer async {
    final api = ApiModule.apiUtil();
    final responseDescriptions = await api.getFixtureDescription(OfferFixture.countGoods);

    List<String> descriptions = responseDescriptions ['text'].split(
        RegExp(r"\\n\\n"));
    descriptions.removeLast();
    return descriptions;
  }

  static String get image {
    Random rnd = Random();
    return 'assets/images/good${1+rnd.nextInt(4-1)}.jpg';
  }

  static String get category {
    Random rnd = Random();
    return 'category${1+rnd.nextInt(4-1)}';
  }

  static double get price {
    Random rnd = Random();
    return 1000.0 * rnd.nextDouble();
  }

  static Map get characters => {
        'Test-key1': 'test-value1',
        'Test-key2': 'test-value2',
        'Test-key3': 'test-value3',
        'Test-key4': 'test-value4',
  };

  static int  get idSeller  => SellerFixture.sellerId;
}