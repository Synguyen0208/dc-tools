import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/models/app_model.dart';
import 'package:store/utils/constants/colors.dart';

class SlideBanner extends StatefulWidget {
  const SlideBanner({super.key});

  @override
  State<SlideBanner> createState() => _SlideBannerState();
}

class _SlideBannerState extends State<SlideBanner> {
  List<String> get slides =>
      Provider.of<AppModel>(context, listen: false).appConfig!.sliders;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: PageView(
        children: slides
            .map(
              (slide) => SizedBox(
                height: 200,
                child: CachedNetworkImage(
                  imageUrl: slide,
                  fit: BoxFit.cover,
                  height: 200,
                  progressIndicatorBuilder: (context, url, progress) =>
                      Shimmer.fromColors(
                    baseColor: AppColors.blackLight200,
                    highlightColor: AppColors.blackLight100,
                    enabled: true,
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
