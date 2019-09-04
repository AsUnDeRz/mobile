import 'package:catalog_app/domain/model/offer.dart';
import 'package:catalog_app/domain/model/seller.dart';
import 'package:catalog_app/domain/repository/offer_repository.dart';

class OfferDataRepository extends OfferRepository {

  @override
  Future<List<Offer>> getListOffer() async {
    return [
      Offer(
       'Good 1',
       'assets/images/good1.jpg',
        'category 1',
        99.99,
        Seller(
          'Ann',
          'The best seller 2018 year!',
          'assets/images/seller.png',
          SellerEnums.PUBLIC,
        ),
        'р-н Центральный Тверь, Московский р-н',
        {
          'Test-key1':'test-value1',
          'Test-key2':'test-value2',
          'Test-key3':'test-value3',
          'Test-key4':'test-value4',
        },
      ),
      Offer(
       'Good 2',
       'assets/images/good2.jpg',
        'category 2',
        1000.0,
        Seller(
          'Ann',
          'The best seller 2018 year!',
          '',
          SellerEnums.PUBLIC,
        ),
        'р-н Центральный Тверь, Московский р-н',
        {
          'Test-key1':'test-value1',
          'Test-key2':'test-value2',
          'Test-key3':'test-value3',
          'Test-key4':'test-value4',
        },
      ),
      Offer(
       'Good 3',
       'assets/images/good3.jpg',
        'category 3',
        50.0,
        Seller(
          'Ann',
          'The best seller 2018 year!',
          'assets/images/seller.png',
          SellerEnums.COMPANY,
        ),
        'р-н Центральный Тверь, Московский р-н',
        {
          'Test-key1':'test-value1',
          'Test-key2':'test-value2',
          'Test-key3':'test-value3',
          'Test-key4':'test-value4',
        },
      ),
      Offer(
       'Good 4',
       'assets/images/good1.jpg',
        'category 4',
        3000,
        Seller(
          'Ann',
          'The best seller 2018 year!',
          'assets/images/seller.png',
          SellerEnums.PUBLIC,
        ),
        'р-н Центральный Тверь, Московский р-н',
        {
          'Test-key1':'test-value1',
          'Test-key2':'test-value2',
          'Test-key3':'test-value3',
          'Test-key4':'test-value4',
        },
      ),
      Offer(
       'Good 5',
       'assets/images/good1.jpg',
        'category 3',
        100.0,
        Seller(
          'Ann',
          'The best seller 2018 year!',
          'assets/images/seller.png',
          SellerEnums.PUBLIC,
        ),
        'р-н Центральный Тверь, Московский р-н',
        {
          'Test-key1':'test-value1',
          'Test-key2':'test-value2',
          'Test-key3':'test-value3',
          'Test-key4':'test-value4',
        },
      ),
      Offer(
       'Good 6',
       'assets/images/good1.jpg',
        'category 3',
        100.0,
        Seller(
          'Ann',
          'The best seller 2018 year!',
          'assets/images/seller.png',
          SellerEnums.PUBLIC,
        ),
        'р-н Центральный Тверь, Московский р-н',
        {
          'Test-key1':'test-value1',
          'Test-key2':'test-value2',
          'Test-key3':'test-value3',
          'Test-key4':'test-value4',
        },
      ),
      Offer(
       'Good 1',
       'assets/images/good1.jpg',
        'category 3',
        100.0,
        Seller(
          'Ann',
          'The best seller 2018 year!',
          'assets/images/seller.png',
          SellerEnums.PUBLIC,
        ),
        'р-н Центральный Тверь, Московский р-н',
        {
          'Test-key1':'test-value1',
          'Test-key2':'test-value2',
          'Test-key3':'test-value3',
          'Test-key4':'test-value4',
        },
      ),
    ];
  }
}