
import 'package:catalog_app/domain/model/offer.dart';

abstract class CatalogView {
  void onRefreshCatalog();
  void onChooseCountGoods(Offer offer);
  void onRouteDetail(Offer offer);
  void onCatalogReceived(List<Offer> catalog);
  void onLogoutSuccess ();
  void onError(dynamic error);
}