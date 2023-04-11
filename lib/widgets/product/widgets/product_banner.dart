import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/app.dart';
import 'package:store/models/app_model.dart';
import 'package:store/models/product_model.dart';
import 'package:store/modules/dynamic_layout/configs/app_config.dart';
import 'package:store/screens/product/product_screen.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/helper/helper.dart';
import 'package:store/widgets/product/widgets/product_card.dart';
import 'package:store/widgets/see_all.dart';

class ProductBanner extends StatefulWidget {
  const ProductBanner({super.key});

  @override
  State<ProductBanner> createState() => _ProductBannerState();
}

class _ProductBannerState extends State<ProductBanner> {
  ProductModel? productModel;
  List<ProductBannerConfig> get productBannerConfigs =>
      Provider.of<AppModel>(context, listen: false)
          .appConfig!
          .productBannerConfigs;

  Future<void> getProductBanners() async {
    await productModel?.getProductBanner(productBannerConfigs);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      productModel = Provider.of<ProductModel>(context, listen: false);
    });
    getProductBanners();
  }

  @override
  void dispose() {
    super.dispose();
    productModel?.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableProvider.value(
      value: productModel,
      child: Consumer<ProductModel>(
        builder: (context, model, child) {
          if (model.productBanner.isEmpty) {
            return buildShimmer();
          }
          return Column(
            children: model.productBanner.map((banner) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          banner.title,
                          style: getTheme(context)
                              .headlineSmall
                              ?.copyWith(height: 1),
                        ),
                        SeeAll(
                          onTap: () => App.navigatorKey.currentState?.pushNamed(
                            "product",
                            arguments: ProductArgument(
                              sortBy: banner.type,
                              categoryId: '',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(10),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: getScreenWidth(context) / 2 - 20,
                          child: ProductCard(product: banner.products[index]),
                        );
                      },
                      itemCount: banner.products.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        width: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Widget buildShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColors.blackLight200,
      highlightColor: AppColors.blackLight100,
      enabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
            3,
            (index) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 20,
                            color: AppColors.blackLight100,
                          ),
                          Container(
                            width: 50,
                            height: 10,
                            color: AppColors.blackLight100,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(10),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.blackLight100,
                            ),
                            width: getScreenWidth(context) / 2 - 20,
                            height: 300,
                          );
                        },
                        itemCount: 10,
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                          width: 20,
                        ),
                      ),
                    ),
                  ],
                )),
      ),
    );
  }
}
