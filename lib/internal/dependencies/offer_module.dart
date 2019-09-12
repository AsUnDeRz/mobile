import 'package:catalog_app/domain/interactor/get_list_offer_case.dart';

import 'offer_repository_module.dart';

class OfferModule {

  static final getListOfferCase = GetListOfferCase(
      OfferRepositoryModule.offerRepository
  );
}


