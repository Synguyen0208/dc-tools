import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/entities/product.dart';
import 'package:store/models/product_model.dart';
import 'package:store/utils/helper/helper.dart';
import 'package:store/widgets/product/widgets/footer_card.dart';
import 'package:store/widgets/product/widgets/pricing.dart';
import 'package:store/widgets/product/widgets/shop_location.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        Provider.of<ProductModel>(context, listen: false);
    return InkWell(
      onTap: () => productModel.onTabProduct(product),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  product.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name ?? "",
                    style: getTheme(context).bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  ProductPricing(
                    priceBeforeDiscount: product.priceBeforeDiscount,
                    price: product.price,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ProductFooter(
                    historicalSold: product.historicalSold,
                    ratingStar: product.itemRating?.ratingStar,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  StoreLocation(
                    location: product.shopLocation,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
