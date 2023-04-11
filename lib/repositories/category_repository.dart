import 'package:store/models/entities/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getCategories({int? page, int? limit});
}
