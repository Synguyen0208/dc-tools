import 'package:store/models/entities/product.dart';

class ProductBanner {
  String type;
  String title;
  List<Product> products;
  ProductBanner(
      {required this.type, required this.title, required this.products});
}
