import 'package:store/models/entities/paginate.dart';
import 'package:store/models/entities/product.dart';

abstract class ProductRepository {
  Future<Paginate<Product>> getProducts(
      {String? categoryId, required int page, String? sortBy});
}
