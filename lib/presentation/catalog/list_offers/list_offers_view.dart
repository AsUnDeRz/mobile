import 'package:catalog_app/domain/model/offer.dart';

abstract class ListOffersView {
  void onRefreshCatalog();
  void onCatalogReceived(List<Offer> catalog);
  void onError(dynamic error);
}