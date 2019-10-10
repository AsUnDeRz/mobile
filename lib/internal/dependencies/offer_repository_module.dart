import 'package:catalog_app_bloc/data/repository/offer_data_repository.dart';
import 'package:catalog_app_bloc/internal/dependencies/api_module.dart';
import 'package:catalog_app_bloc/internal/dependencies/db_module.dart';

class OfferRepositoryModule {
  static final offerDataRepository = OfferDataRepository(
      ApiModule.apiUtil(),
      DbModule.ormOffer(),
  );
}