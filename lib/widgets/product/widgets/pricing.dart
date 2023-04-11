import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/helper/helper.dart';

class ProductPricing extends StatelessWidget {
  const ProductPricing({
    super.key,
    this.priceBeforeDiscount,
    required this.price,
  });

  final num? priceBeforeDiscount;
  final num price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (priceBeforeDiscount != null && priceBeforeDiscount != 0)
          Text(
            formatCurrency(priceBeforeDiscount),
            style: getTheme(context).bodyMedium?.copyWith(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                  fontSize: 12,
                ),
          ),
        const SizedBox(width: 5),
        Text(
          formatCurrency(
            price,
          ),
          style: getTheme(context).bodyMedium?.copyWith(
                color: AppColors.primary,
              ),
        ),
      ],
    );
  }
}
