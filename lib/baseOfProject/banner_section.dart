import 'package:flutter/material.dart';
import '../widgets/data.dart';

class BannerSection extends StatelessWidget {
  final double screenWidth;
  final PageController pageController;
  final double currentPage;

  const BannerSection({
    super.key,
    required this.screenWidth,
    required this.pageController,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.00, right: screenWidth * 0.02),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: banners.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: screenWidth * 0.02),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[300],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            banners[index],
                            fit: BoxFit.cover,
                            width: screenWidth * 0.9,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[200],
                                child: const Icon(Icons.broken_image, color: Colors.grey, size: 24),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    height: 8,
                    width: 90,
                    child: Stack(
                      children: [
                        Container(
                          height: 8,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Container(height: 8, color: Colors.grey[300]),
        ],
      ),
    );
  }
}