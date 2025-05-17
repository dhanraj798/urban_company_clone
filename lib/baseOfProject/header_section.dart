import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final double screenWidth;

  const HeaderSection({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(screenWidth * 0.04, 50, screenWidth * 0.04, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '7010',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '7th Floor- Marvel Figo- Magarpatta R...',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.032,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart_rounded, color: Colors.grey[600], size: screenWidth * 0.065),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}