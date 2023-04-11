import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/utils/constants/icons.dart';
import 'package:store/utils/helper/helper.dart';

class StoreLocation extends StatelessWidget {
  const StoreLocation({super.key, required this.location});
  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppIcons.location,
          width: 13,
          height: 13,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          location,
          style: getTheme(context).bodySmall?.copyWith(
                color: Colors.grey,
              ),
        ),
      ],
    );
  }
}
