import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/models/categories_model.dart';
import 'package:store/screens/category/widgets/category_card.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/helper/helper.dart';
import 'package:store/widgets/refresh_scroll_physics.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  CategoryModel get categoryModel =>
      Provider.of<CategoryModel>(context, listen: false);

  void getCategories() async {
    await categoryModel.getCategories();
  }

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: AppColors.blackLight100,
        elevation: 5,
        title: Text(
          'Danh mục sản phẩm',
          style: getTheme(context)
              .headlineSmall
              ?.copyWith(color: AppColors.white, fontWeight: FontWeight.normal),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: SafeArea(
        child: ListenableProvider.value(
          value: categoryModel,
          child: Consumer<CategoryModel>(
            builder: (context, model, child) {
              if (model.isLoading || model.categories.isEmpty) {
                return Shimmer.fromColors(
                  baseColor: AppColors.blackLight200,
                  highlightColor: AppColors.blackLight100,
                  enabled: true,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    physics: const RefreshScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.blackLight100,
                        ),
                      );
                    },
                    itemCount: 10,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      height: 20,
                    ),
                  ),
                );
              }

              return ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                physics: const RefreshScrollPhysics(),
                itemBuilder: (context, index) {
                  return CategoryCard(category: model.categories[index]);
                },
                itemCount: model.categories.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 20,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
