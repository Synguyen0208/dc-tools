import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/app_model.dart';
import 'package:store/models/product_model.dart';
import 'package:store/modules/dynamic_layout/configs/app_config.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/helper/helper.dart';

class ProductSortBar extends StatefulWidget {
  const ProductSortBar({super.key, required this.onSort});
  final void Function() onSort;

  @override
  State<ProductSortBar> createState() => _ProductSortBarState();
}

class _ProductSortBarState extends State<ProductSortBar> {
  SortBarConfig get sortBar =>
      Provider.of<AppModel>(context, listen: false).appConfig!.sortBarConfig;
  ProductModel get productModel =>
      Provider.of<ProductModel>(context, listen: false);
  @override
  Widget build(BuildContext context) {
    int sortBarLength = sortBar.sortBars.length;
    return Row(
      children: sortBar.sortBars
          .map(
            (element) => Expanded(
              child: InkWell(
                onTap: () {
                  productModel.onSort(element.value);
                  widget.onSort();
                },
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: sortBar.sortBars.elementAt(sortBarLength - 1) !=
                                element
                            ? const Border(
                                right: BorderSide(
                                  color: AppColors.blackLight400,
                                  width: 0.5,
                                ),
                              )
                            : null,
                      ),
                      width: getScreenWidth(context) / sortBar.sortBars.length,
                      child: Text(
                        element.title,
                        textAlign: TextAlign.center,
                        style: getTheme(context).bodyMedium?.copyWith(
                              color: AppColors.blackDark500,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: productModel.sortBy == element.value
                          ? AppColors.primary
                          : null,
                      height: 2,
                      width: double.infinity,
                    )
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
