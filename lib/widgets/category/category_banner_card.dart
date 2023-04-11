import 'package:flutter/material.dart';
import 'package:store/app.dart';
import 'package:store/models/entities/category.dart';
import 'package:store/screens/product/product_screen.dart';
import 'package:store/utils/constants/colors.dart';

class CategoryBannerCard extends StatelessWidget {
  const CategoryBannerCard({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => App.navigatorKey.currentState?.pushNamed(
        "product",
        arguments: ProductArgument(
          categoryId: category.id,
          sortBy: "ctime",
          title: category.name,
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: AppColors.primary.withOpacity(0.4)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.network(
                category.image,
                width: 60,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(category.name)
        ],
      ),
    );
  }
}
