import 'package:flutter/material.dart';
import '../subPagesOf6Box/sub_Full_SalonForMen_Half.dart'; // Importing the SalonForMenPage
// Importing the SpaForMenPage (Placeholder)

class men_Spa_Half_Page extends StatelessWidget {
  final String title;
  final bool isDraggable;
  final double initialHeight;

  const men_Spa_Half_Page({
    super.key,
    required this.title,
    this.isDraggable = false,
    this.initialHeight = 0.3, // Fixed at 30%
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      clipBehavior: Clip.none, // Allows the button to appear outside the sheet
      children: [
        DraggableScrollableSheet(
          initialChildSize: initialHeight,
          minChildSize: initialHeight,
          maxChildSize: initialHeight,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                controller: scrollController,
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
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildServiceBox(
                            context,
                            imagePath: 'assets/images/waterPurifier.png',
                            label: 'Salon for Men',
                          ),
                          _buildServiceBox(
                            context,
                            imagePath: 'assets/images/MenSpa.jpg',
                            label: 'Spa for Men',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        // Floating Cancel Button
        Positioned(
          top: -40,
          right: 10,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context); // Closes the sheet
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
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

  Widget _buildServiceBox(BuildContext context, {required String imagePath, required String label}) {
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        // Navigation logic based on the label
        if (label == 'Salon for Men') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SalonForMenPage()),
          );
        } else if (label == 'Spa for Men') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SpaForMenPage()),
          );
        }
      },
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          Container(
            height: 80,
            width: screenWidth * 0.35,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 3,
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
            width: screenWidth * 0.35,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

// Placeholder SpaForMenPage class
class SpaForMenPage extends StatelessWidget {
  const SpaForMenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spa for Men'),
      ),
      body: const Center(
        child: Text('Spa for Men Page - Under Construction'),
      ),
    );
  }
}