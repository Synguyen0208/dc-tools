import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/models/categories_model.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/widgets/category/category_banner_card.dart';
import 'package:store/widgets/refresh_scroll_physics.dart';

class CategoryBanner extends StatefulWidget {
  const CategoryBanner({super.key});

  @override
  State<CategoryBanner> createState() => _CategoryBannerState();
}

class _CategoryBannerState extends State<CategoryBanner> {
  CategoryModel get categoryModel =>
      Provider.of<CategoryModel>(context, listen: false);

  void getCategories() async {
    await categoryModel.getCategories(page: 0);
  }

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListenableProvider.value(
        value: categoryModel,
        child: Consumer<CategoryModel>(
          builder: (context, model, child) {
            if (model.isLoading||model.categories.isEmpty) {
              return buildShimmer();
            }
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              physics: const RefreshScrollPhysics(),
              itemBuilder: (context, index) {
                return CategoryBannerCard(category: model.categories[index]);
              },
              itemCount: model.categories.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                width: 20,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColors.blackLight200,
      highlightColor: AppColors.blackLight100,
      enabled: true,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        physics: const RefreshScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: AppColors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: AppColors.blackLight200,
                width: 30,
                height: 10,
              )
            ],
          );
        },
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 20,
        ),
      ),
    );
  }
}
