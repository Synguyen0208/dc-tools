import 'package:flutter/material.dart';
import 'package:store/models/entities/paginate.dart';
import 'package:store/models/entities/product.dart';
import 'package:store/models/entities/product_banner.dart';
import 'package:store/modules/dynamic_layout/configs/app_config.dart';
import 'package:store/repositories/product_repository.dart';
import 'package:store/services/product_service.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductModel with ChangeNotifier {
  int _currentPage = 0;
  int _lastPage = 1;
  bool _isLoading = false;
  String _sortBy = "";
  String _catID = "";
  List<ProductBanner> _productBanners = [];
  final ProductRepository _productRepository = ProductService();
  List<Product> _products = [];
  List<Product> get products => _products;
  int get lastPage => _lastPage;
  int get currentPage => _currentPage;
  bool get isLoading => _isLoading;
  String get sortBy => _sortBy;
  List<ProductBanner> get productBanner => _productBanners;

  Future<void> getProductBanner(List<ProductBannerConfig> configs) async {
    List<ProductBanner> banners = [];
    await Future.forEach(configs, (config) async {
      Paginate<Product> data = await _productRepository.getProducts(
        page: 1,
        sortBy: config.keySearch,
      );
      if (data.data.isNotEmpty) {
        banners.add(ProductBanner(
          products: data.data,
          title: config.title,
          type: config.keySearch,
        ));
      }
    });
    _productBanners = banners;
    notifyListeners();
  }

  Future<void> getProducts({String? catID, String? sortBy}) async {
    if (sortBy != null) {
      _sortBy = sortBy;
    }

    _catID = catID ?? '';
    _isLoading = true;
    _currentPage = 0;
    Paginate<Product> productPaginate = await _productRepository.getProducts(
      categoryId: catID,
      page: _currentPage,
      sortBy: _sortBy,
    );
    _lastPage = productPaginate.lastPage;
    _products = productPaginate.data;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadMore() async {
    if (_currentPage < _lastPage) {
      _currentPage++;
      Paginate<Product> productPaginate = await _productRepository.getProducts(
        page: _currentPage,
        categoryId: _catID,
        sortBy: _sortBy,
      );
      _lastPage = productPaginate.lastPage;
      _products.addAll(productPaginate.data);
    }
    notifyListeners();
  }

  Future<void> onSort(String sortBy) async {
    _sortBy = sortBy;
    notifyListeners();
  }

  void clear() {
    _products.clear();
    _currentPage = 0;
    _lastPage = 0;
    _isLoading = false;
    _sortBy = "";
  }

  void onTabProduct(Product product) async {
    await launchUrl(Uri.parse(
        "https://shopee.vn/${product.name}-i.192145885.${product.itemid}"));
  }
}
