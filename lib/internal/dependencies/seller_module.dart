import 'package:catalog_app/domain/interactor/get_seller_by_id.dart';
import 'package:catalog_app/internal/dependencies/seller_repository_module.dart';

class SellerModule {

  static final getSellerByIdCase = GetSellerByIdCase(
    SellerRepositoryModule.sellerRepository);
}


