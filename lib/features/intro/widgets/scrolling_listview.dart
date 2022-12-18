import 'dart:async';
import 'package:movie99/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ScrollingListView extends StatefulWidget {
  final int duration;
  final bool? reverse;
  final int starterIndex;
  const ScrollingListView({
    Key? key,
    required this.duration,
    this.reverse,
    required this.starterIndex,
  }) : super(key: key);

  @override
  State<ScrollingListView> createState() => _ScrollingListViewState();
}

class _ScrollingListViewState extends State<ScrollingListView> {
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        _startScroll();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _startScroll();
    });

    super.initState();
  }

  _startScroll() {
    final currentScrollPosition = _scrollController.offset;
    final scrollEndPosition = _scrollController.position.maxScrollExtent;
    scheduleMicrotask(() {
      _scrollController.animateTo(
        currentScrollPosition == scrollEndPosition ? 0 : scrollEndPosition,
        duration: Duration(seconds: widget.duration),
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.w / 3,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _scrollController,
        itemCount: 5,
        reverse: widget.reverse ?? false,
        itemBuilder: (context, index) => _ImageItem(
          index: widget.starterIndex + index,
        ),
      ),
    );
  }
}

class _ImageItem extends StatelessWidget {
  const _ImageItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      height: 200,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/images/$index.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
