import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/helper/helper.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: AppColors.blackLight200,
        highlightColor: AppColors.blackLight100,
        enabled: true,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (getScreenWidth(context) / 2 - 48) / 223,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: double.infinity,
                height: 223,
                child: Card(),
              );
            }),
      ),
    );
  }
}
