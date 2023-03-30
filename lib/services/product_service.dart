import 'package:store/models/entities/paginate.dart';
import 'package:store/models/entities/product.dart';
import 'package:store/repositories/product_repository.dart';
import 'package:store/services/dio_service.dart';

class ProductService extends ProductRepository {
  @override
  Future<Paginate<Product>> getProducts({required int page}) async {
    try {
      dynamic res = await dio
          .get("/search_items?shopid=192145885&limit=10&offset=$page");

      int lastPage = res.data["total_count"] ~/ 10;

      if (res.statusCode == 200) {
        List<Product> products = [];
        for (var item in res.data["items"]) {
          products.add(
            Product.fromJson(item?["item_basic"]),
          );
        }
        return Paginate(data: products, currentPage: page, lastPage: lastPage);
      }
      return Paginate(data: [], currentPage: page, lastPage: lastPage);
    } catch (e) {
      return Paginate(data: [], currentPage: page, lastPage: 0);
    }
  }
}
