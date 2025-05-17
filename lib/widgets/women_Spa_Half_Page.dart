import 'package:flutter/material.dart';
import '../subPagesOf6Box/sub_Full_Women_Salon_half.dart';
import '../subPagesOf6Box/sub_Full_Women_Spa_half.dart';
import '../subPagesOf6Box/sub_Full_Women_Hair_half.dart';

class women_Spa_Half_Page extends StatelessWidget {
  final String title;
  final bool isDraggable;
  final double initialHeight;

  const women_Spa_Half_Page({
    super.key,
    required this.title,
    this.isDraggable = false,
    this.initialHeight = 0.3,
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
                            imagePath: 'assets/images/note.png',
                            label: 'Salon for Women',
                          ),
                          _buildServiceBox(
                            context,
                            imagePath: 'assets/images/note(1).png',
                            label: 'Spa for Women',
                          ),
                          _buildServiceBox(
                            context,
                            imagePath: 'assets/images/MenSpa.jpg',
                            label: 'Hair Studio for Women',
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
          top: -50, // Places the button above the sheet
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
        if(label == 'Salon for Women'){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SalonForWomenPage()),
          );

        }
        else if( label == "Spa for Women"){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SpaForWomenPage()),
          );
        }
        else if(label == "Hair Studio for Women"){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SubFullWomenHairHalf(title: "hair Studio",)),);
        }
      },
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          Container(
            height: 80,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
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
            width: screenWidth * 0.2,
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