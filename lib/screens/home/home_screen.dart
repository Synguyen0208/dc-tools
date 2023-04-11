import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/screens/home/widgets/category_banner.dart';
import 'package:store/screens/home/widgets/slide_banner.dart';
import 'package:store/utils/constants/images.dart';
import 'package:store/widgets/product/widgets/product_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            snap: true,
            floating: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.search),
                AppImages.logo,
                const Icon(Icons.heart_broken)
              ],
            ),
          ),
          CupertinoSliverRefreshControl(
            onRefresh: () async {},
            refreshTriggerPullDistance: 175,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: const [
                CategoryBanner(),
                SlideBanner(),
                SizedBox(
                  height: 20,
                ),
                ProductBanner(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
