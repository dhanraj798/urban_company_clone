import 'package:flutter/material.dart';

class cleaning_Half_Page extends StatelessWidget {
  final String title;
  final bool isDraggable;
  final double initialHeight;

  const cleaning_Half_Page({
    super.key,
    required this.title,
    this.isDraggable = false,
    this.initialHeight = 0.7,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: screenHeight * 0.7,
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
                  const SizedBox(height: 45),
                  const Text(
                    'Cleaning',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildServiceBox(
                        context,
                        imagePath: 'assets/images/salon.jpg',
                        label: 'Bathroom Cleaning',
                        boxWidth: screenWidth * 0.21,
                      ),
                      _buildServiceBox(
                        context,
                        imagePath: 'assets/images/spa.jpg',
                        label: 'Kitchen Cleaning',
                        boxWidth: screenWidth * 0.21,
                      ),
                      _buildServiceBox(
                        context,
                        imagePath: 'assets/images/hair_studio.jpg',
                        label: 'Full Home Cleaning',
                        boxWidth: screenWidth * 0.21,
                      ),
                      _buildServiceBox(
                        context,
                        imagePath: 'assets/images/makeup.jpg',
                        label: 'Sofa & Carpet Cleaning',
                        boxWidth: screenWidth * 0.21,
                      ),
                    ],
                  ),
                  const SizedBox(height: 55),
                  const Text(
                    'Pest Control',
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
                        label: 'Cockroach, Ant & General Pest Control',
                        boxWidth: screenWidth * 0.21,
                      ),
                      SizedBox(width: 15),
                      _buildServiceBox(
                        context,
                        imagePath: 'assets/images/carpet_cleaning.jpg',
                        label: 'Termite Control',
                        boxWidth: screenWidth * 0.21,
                      ),
                      SizedBox(width: 15),
                      _buildServiceBox(
                        context,
                        imagePath: 'assets/images/sofa_cleaning.jpg',
                        label: 'Bed Bugs Control',
                        boxWidth: screenWidth * 0.21,
                      ),
                      const SizedBox(width: 0), // 4th slot empty if needed
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

  Widget _buildServiceBox(BuildContext context, {
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
