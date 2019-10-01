import 'package:catalog_app/domain/bloc/catalog_bloc.dart';

import 'offer_repository_module.dart';

class OfferModule {
  static CatalogBloc catalogBloc() {
    return CatalogBloc(OfferRepositoryModule.offerDataRepository);
  }
}


