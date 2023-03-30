import 'package:flutter/material.dart';
import 'package:store/models/entities/paginate.dart';
import 'package:store/models/entities/product.dart';
import 'package:store/repositories/product_repository.dart';
import 'package:store/services/product_service.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductModel with ChangeNotifier {
  int _currentPage = 0;
  int _lastPage = 1;
  final ProductRepository _productRepository = ProductService();
  List<Product> _products = [];

  List<Product> get products => _products;
  int get lastPage => _lastPage;

  Future<void> getProducts() async {
    _currentPage = 0;
    Paginate<Product> productPaginate = await _productRepository.getProducts(
      page: _currentPage,
    );
    _lastPage = productPaginate.lastPage;
    _products = productPaginate.data;
    notifyListeners();
  }

  Future<void> loadMore() async {
    if (_currentPage < _lastPage) {
      _currentPage++;
      Paginate<Product> productPaginate = await _productRepository.getProducts(
        page: _currentPage,
      );
      _lastPage = productPaginate.lastPage;
      _products.addAll(productPaginate.data);
    }
    notifyListeners();
  }

  void onTabProduct(Product product) async {
    await launchUrl(Uri.parse(
        "https://shopee.vn/${product.name}-i.192145885.${product.itemid}"));
  }
}
