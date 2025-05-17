import 'package:flutter/material.dart';

class ThoughtfulCurationsSection extends StatelessWidget {
  final double screenWidth;

  const ThoughtfulCurationsSection({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const SizedBox(height: 26),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.04, 0, screenWidth * 0.04, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thoughtful curations',
                    style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'of our finest experiences',
                    style: TextStyle(fontSize: screenWidth * 0.035, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 300,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: screenWidth * 0.04),
              itemCount: 8,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => print('Tapped on video card $index'),
                  child: Container(
                    width: screenWidth * 0.38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[300],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/sample.jpg',
                        fit: BoxFit.cover,
                        height: 210,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 40),
          Container(height: 8, color: Colors.grey[300]),
        ],
      ),
    );
  }
}