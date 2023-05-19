import 'dart:async';
import 'dart:math';

import 'package:borrow_app/data/data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageListView extends StatefulWidget {
  final int starIndex;
  const ImageListView({super.key, required this.starIndex});

  @override
  State<ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose the ScrollController
    super.dispose();
  }

  void _scrollListener() {
    if (!_scrollController.position.atEdge) {
      _autoScroll();
    }
  }

  void _autoScroll() {
    final currentScrollPosition = _scrollController.offset;
    final itemHeight = MediaQuery.of(context).size.height * 0.40;
    final targetIndex = 2; // Example: Scroll to index 2

    scheduleMicrotask(() {
      _scrollController.animateTo(
        targetIndex * itemHeight,
        duration: const Duration(seconds: 3),
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 1.96 * pi,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.60,
        height: MediaQuery.of(context).size.height * 0.60,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 5,
          itemBuilder: (context, index) {
            return CachedNetworkImage(
              imageUrl: products[widget.starIndex + index].productImageUrl,
              imageBuilder: (context, imageProvider) {
                return Container(
                  margin: const EdgeInsets.only(
                    right: 8.0,
                    left: 8.0,
                    top: 10.0,
                  ),
                  height: MediaQuery.of(context).size.height * 0.40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
