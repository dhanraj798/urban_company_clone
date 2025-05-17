import 'package:flutter/material.dart';

class SearchBarDelegate extends SliverPersistentHeaderDelegate {
  final FocusNode focusNode;
  final TextEditingController controller;

  SearchBarDelegate({required this.focusNode, required this.controller});

  @override
  double get minExtent => 60.0;
  @override
  double get maxExtent => 60.0;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return GestureDetector(
      onTap: () {
        focusNode.requestFocus();
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.center,
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: 'Search...',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            filled: true,
            fillColor: Colors.grey[100],
          ),
          onSubmitted: (value) {
            print('Search query: $value');
          },
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SearchBarDelegate oldDelegate) =>
      oldDelegate.focusNode != focusNode || oldDelegate.controller != controller;
}