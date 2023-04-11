import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product_model.dart';
import 'package:store/widgets/product/product_listing.dart';
import 'package:store/widgets/product/product_shimmer.dart';
import 'package:store/widgets/product/product_sort_bar.dart';

class ProductArgument {
  final String? categoryId;
  final String? sortBy;
  final String? title;

  ProductArgument({
    required this.categoryId,
    this.sortBy,
    this.title,
  });
}

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, this.categoryId, this.sortBy, this.title});
  final String? categoryId;
  final String? sortBy;
  final String? title;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductModel? productModel;

  Future<void> getProductList({String? sortBy}) async {
    await productModel?.getProducts(catID: widget.categoryId, sortBy: sortBy);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      productModel = Provider.of<ProductModel>(context, listen: false);
    });
    initData();
  }

  void initData() {
    getProductList(sortBy: widget.sortBy);
  }

  @override
  void dispose() {
    super.dispose();
    productModel?.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'Sản phẩm'),
      ),
      body: SafeArea(
        child: ListenableProvider.value(
          value: productModel,
          child: Consumer<ProductModel>(
            builder: (context, model, child) {
              return Column(
                children: [
                  ProductSortBar(
                    onSort: () {
                      getProductList();
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  model.isLoading
                      ? const ProductShimmer()
                      : Expanded(
                          child: ProductListing(
                            products: model.products,
                            canLoadMore:
                                model.currentPage < (model.lastPage - 1),
                            onLoadMore: model.loadMore,
                            onRefresh: () async {
                              await getProductList();
                            },
                          ),
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
