import 'package:catalog_app/data/repository/offer_data_repository.dart';
import 'package:catalog_app/internal/dependencies/db_module.dart';

class OfferRepositoryModule {

  static final offerDataRepository = OfferDataRepository(DbModule.dbUtil);
}