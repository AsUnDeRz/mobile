import 'package:catalog_app_bloc/data/api/model/api_seller.dart';
import 'package:catalog_app_bloc/domain/model/seller.dart';

class ApiSellerMapper {
  static Seller toSeller(dynamic map) {
    return Seller(
        map [ApiSeller.ID],
        map [ApiSeller.NAME],
        map [ApiSeller.IMAGE],
        map [ApiSeller.TYPE],
        map [ApiSeller.INFO]
    );
  }
}