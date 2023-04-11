import 'package:flutter/material.dart';
import 'package:store/models/entities/category.dart';
import 'package:store/repositories/category_repository.dart';
import 'package:store/services/category_service.dart';

class CategoryModel extends ChangeNotifier {
  final CategoryRepository _categoryRepository = CategoryService();
  List<Category> _categories = [];
  bool _isLoading = false;

  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;

  Future<void> getCategories({int? page, int? limit}) async {
    if (categories.isEmpty) {
      _isLoading = true;
    }
    _categories = await _categoryRepository.getCategories(page: page, limit: limit);
    _isLoading = false;
    notifyListeners();
  }
}
