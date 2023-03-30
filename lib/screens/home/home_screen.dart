import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:store/models/entities/product.dart';
import 'package:store/models/product_model.dart';
import 'package:store/product_card.dart';
import 'package:store/widgets/load_more_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductModel get productModel =>
      Provider.of<ProductModel>(context, listen: false);

  void getProductList() async {
    await productModel.getProducts();
  }

  @override
  void initState() {
    super.initState();
    getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListenableProvider.value(
        value: productModel,
        child: Consumer<ProductModel>(
          builder: (context, model, child) {
            return LoadMoreBuilder(
              onLoadMore: model.loadMore,
              onRefresh: () async {
                await model.getProducts();
                return;
              },
              itemBuilder: (context, index) {
                return ProductCard(product: model.products[index]);
              },
              separator: const SizedBox(height: 10),
              itemCount: model.products.length + 1,
              itemLength: model.products.length,
            );
          },
        ),
      ),
    );
  }
}
