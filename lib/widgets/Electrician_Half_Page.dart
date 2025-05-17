import 'package:flutter/material.dart';

class Electrician_Half_Page extends StatelessWidget {
  final String title;
  final bool isDraggable;
  final double initialHeight;

  const Electrician_Half_Page({
    super.key,
    required this.title,
    this.isDraggable = false,
    this.initialHeight = 0.5,  // This should open 50% height
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    print('Screen Height: $screenHeight');  // Debugging the screen height

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: screenHeight * initialHeight,  // Should open 50% height
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 3,
                spreadRadius: 0,
                offset: Offset(0, -3),
              ),
            ],
          ),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 54),

                  // Section 1
                  const Text(
                    'Home repairs',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildServiceBox(
                        context,
                        imagePath: 'assets/images/salon.jpg',
                        label: 'Electrician',
                        boxWidth: screenWidth * 0.2,
                      ),
                      const SizedBox(width: 14),
                      _buildServiceBox(
                        context,
                        imagePath: 'assets/images/spa.jpg',
                        label: 'Plumber',
                        boxWidth: screenWidth * 0.2,
                      ),
                      const SizedBox(width: 14),
                      _buildServiceBox(
                        context,
                        imagePath: 'assets/images/hair_studio.jpg',
                        label: 'Carpenter',
                        boxWidth: screenWidth * 0.2,
                      ),
                    ],
                  ),

                  const SizedBox(height: 54),

                  // Section 2
                  const Text(
                    'Home Installation',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildServiceBox(
                        context,
                        imagePath: 'assets/images/deep_cleaning.jpg',
                        label: 'Furniture Assembly',
                        boxWidth: screenWidth * 0.2,
                      ),
                      const SizedBox(width: 14),
                      _buildServiceBox(
                        context,
                        imagePath: 'assets/images/carpet_cleaning.jpg',
                        label: 'Geyser',
                        boxWidth: screenWidth * 0.2,
                      ),
                      const SizedBox(width: 14),
                      _buildServiceBox(
                        context,
                        imagePath: 'assets/images/sofa_cleaning.jpg',
                        label: 'IKEA Furniture Assembly',
                        boxWidth: screenWidth * 0.2,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 16,
          top: -44,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.close,
                color: Colors.black87,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildServiceBox(
      BuildContext context, {
        required String imagePath,
        required String label,
        required double boxWidth,
      }) {
    return SizedBox(
      height: 110,
      child: InkWell(
        onTap: () {
          print('Tapped on $label');
        },
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 70,
              width: boxWidth,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.grey[300]!, width: 0),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 3,
                    spreadRadius: 0,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: const Icon(
                        Icons.broken_image,
                        color: Colors.grey,
                        size: 30,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: boxWidth,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
