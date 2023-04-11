import 'package:store/models/entities/category.dart';
import 'package:store/repositories/category_repository.dart';
import 'package:store/services/dio_service.dart';

class CategoryService extends CategoryRepository {
  @override
  Future<List<Category>> getCategories({int? page, int? limit}) async {
    try {
      dynamic res = await dio.get(
          "/get_categories?shopid=192145885&limit=${page != null ? limit ?? 10 : ''}&offset=${page ?? ''}");

      dynamic data = res.data["data"];
      List<dynamic> categoriesMap = data["shop_categories"];

      if (res.statusCode == 200) {
        List<Category> categories = [];
        for (var item in categoriesMap) {
          categories.add(
            Category.fromJson(item),
          );
        }
        return categories;
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
