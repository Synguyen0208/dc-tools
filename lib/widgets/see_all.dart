import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/helper/helper.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        "See all",
        style: getTheme(context).displayMedium?.copyWith(
          color: AppColors.primary
        ),
      ),
    );
  }
}
