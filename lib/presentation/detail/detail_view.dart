import 'package:catalog_app/domain/model/offer.dart';

abstract class DetailView {
  void onChooseCountGoods(Offer offer);
  void onError(String error);
}