import 'package:catalog_app/domain/model/offer.dart';
import 'package:catalog_app/domain/model/cart.dart';

abstract class CatalogView {
  void onCartUpdated(Cart cart);
  void onRouteDetail(Offer offer);
  void onCatalogReceived(List<Offer> catalog);
  void onLogoutSuccess ();
  void onError(String error);
}