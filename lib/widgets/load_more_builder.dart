import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';

class LoadMoreBuilder extends StatefulWidget {
  const LoadMoreBuilder({
    super.key,
    required this.itemBuilder,
    required this.separator,
    required this.itemCount,
    required this.onLoadMore,
    required this.onRefresh,
    this.onInit,
    this.padding,
    required this.itemLength,
  });

  final Widget Function(BuildContext, int) itemBuilder;
  final Widget separator;
  final int itemCount;
  final int itemLength;
  final Function onLoadMore;
  final Future<void> Function() onRefresh;
  final void Function()? onInit;
  final EdgeInsetsGeometry? padding;

  @override
  State<LoadMoreBuilder> createState() => _LoadMoreBuilderState();
}

class _LoadMoreBuilderState extends State<LoadMoreBuilder> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent * 0.95) {
        widget.onLoadMore();
      }
    });
    if (widget.onInit != null) {
      widget.onInit!();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: widget.onRefresh,
      child: ListView.separated(
        padding: widget.padding ??
            const EdgeInsets.symmetric(
              vertical: 10,
              // horizontal: 10
            ),
        controller: _scrollController,
        itemBuilder: (context, index) {
          if (index == widget.itemLength) {
            return Center(
              child: SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              ),
            );
          }
          return widget.itemBuilder(context, index);
        },
        separatorBuilder: (context, index) {
          return widget.separator;
        },
        itemCount: widget.itemCount,
      ),
    );
  }
}
