import 'package:flutter/material.dart';
import 'package:store/models/entities/product.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/icons.dart';
import 'package:store/utils/helper/helper.dart';
import 'package:store/widgets/grid_view_load_more.dart';
import 'package:store/widgets/product/widgets/product_card.dart';

class ProductListing extends StatefulWidget {
  const ProductListing({
    super.key,
    required this.products,
    this.onRefresh,
    this.onLoadMore,
    required this.canLoadMore,
  });
  final List<Product> products;
  final Future<void> Function()? onRefresh;
  final void Function()? onLoadMore;
  final bool canLoadMore;

  @override
  State<ProductListing> createState() => _ProductListingState();
}

class _ProductListingState extends State<ProductListing> {
  @override
  Widget build(BuildContext context) {
    if (widget.products.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppIcons.empty_bag,
              scale: 4,
            ),
            Text(
              "No products found",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.blackLight300,
                  ),
            )
          ],
        ),
      );
    }
    return GridViewLoadMore(
      padding: const EdgeInsets.all(5),
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      canLoadMore: widget.canLoadMore,
      onLoadMore: widget.onLoadMore,
      onRefresh: widget.onRefresh,
      builder: (context, index) {
        return ProductCard(product: widget.products[index]);
      },
      childCount: widget.products.length,
      childAspectRatio: (getScreenWidth(context) / 2 - 48) / 223,
    );
  }
}
