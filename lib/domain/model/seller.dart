
class Seller {
  static const ID = 'seller_id';
  static const NAME = 'seller_name';
  static const TYPE = 'seller_type';
  static const INFO = 'seller_info';

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