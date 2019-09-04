class Seller {
  final String name;
  final String image;
  final String type;
  final String info;

  Seller(
      this.name,
      this.type,
      this.image,
      this.info,
      );
}

class SellerEnums {
  static const String PUBLIC = "Частное лицо";
  static const String COMPANY = "Компания";
}