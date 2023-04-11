import 'package:flutter/material.dart';

class GridViewLoadMore extends StatefulWidget {
  const GridViewLoadMore({
    super.key,
    required this.builder,
    this.childCount,
    this.onRefresh,
    this.onLoadMore,
    required this.canLoadMore,
    this.padding = const EdgeInsets.all(10),
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    this.crossAxisCount = 2,
    this.childAspectRatio = 1.0,
    this.header,
  });

  final Widget? Function(BuildContext, int) builder;
  final int? childCount;
  final Future<void> Function()? onRefresh;
  final void Function()? onLoadMore;
  final bool canLoadMore;
  final EdgeInsetsGeometry padding;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final int crossAxisCount;
  final double childAspectRatio;
  final Widget? header;

  @override
  State<GridViewLoadMore> createState() => _GridViewLoadMoreState();
}

class _GridViewLoadMoreState extends State<GridViewLoadMore> {
  final ScrollController _controller = ScrollController();
  final double _endReachedThreshold = 200;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    final thresholdReached =
        _controller.position.extentAfter < _endReachedThreshold;

    if (thresholdReached && widget.onLoadMore != null) {
      widget.onLoadMore!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: widget.onRefresh!,
      child: CustomScrollView(
        controller: _controller,
        slivers: [
          widget.header != null
              ? SliverToBoxAdapter(child: widget.header!)
              : const SliverToBoxAdapter(
                  child: SizedBox(),
                ),
          SliverPadding(
            padding: widget.padding,
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: widget.childAspectRatio,
                crossAxisCount: widget.crossAxisCount,
                crossAxisSpacing: widget.crossAxisSpacing,
                mainAxisSpacing: widget.mainAxisSpacing,
              ),
              delegate: SliverChildBuilderDelegate(
                widget.builder,
                childCount: widget.childCount,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: widget.canLoadMore
                ? Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
