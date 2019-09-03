import 'package:catalog_app/domain/model/offer.dart';

abstract class CatalogView {
  void onCatalogReceived(List<Offer> catalog);
  void onLogoutSuccess ();
  void onError(String error);
}