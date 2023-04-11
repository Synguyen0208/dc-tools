import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:store/utils/helper/helper.dart';

class ProductFooter extends StatelessWidget {
  const ProductFooter(
      {super.key, required this.ratingStar, required this.historicalSold});

  final num? ratingStar;
  final int historicalSold;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          initialRating: double.parse(ratingStar?.toString() ?? "0"),
          itemSize: 10,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (_) {},
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          "Đã bán $historicalSold",
          style: getTheme(context).displaySmall,
        )
      ],
    );
  }
}
