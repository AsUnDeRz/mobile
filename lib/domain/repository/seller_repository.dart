import 'package:catalog_app/domain/model/seller.dart';

abstract class SellerRepository {
  Future <Seller> getSellerById(int id);
}