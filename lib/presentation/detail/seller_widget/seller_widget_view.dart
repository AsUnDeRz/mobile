import 'package:catalog_app/domain/model/seller.dart';

abstract class SellerBlockDetailView {
  void onSellerReceived(Seller seller);
  void onError(String error);
}