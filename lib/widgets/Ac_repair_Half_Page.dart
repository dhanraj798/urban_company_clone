import 'package:flutter/material.dart';

class Ac_repair_Half_Page extends StatelessWidget {
  final String title;
  final bool isDraggable;
  final double initialHeight;

  const Ac_repair_Half_Page({
    super.key,
    required this.title,
    this.isDraggable = true,
    this.initialHeight = 0.9, // Draggable, starts at 90%
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        DraggableScrollableSheet(
          initialChildSize: initialHeight,
          minChildSize: 0.3,
          maxChildSize: 0.9,
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
                      const Text(
                        'Home appliances',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildServiceBox(
                                context,
                                imagePath: 'assets/images/ac.jpg',
                                label: 'AC',
                                boxWidth: screenWidth * 0.2,
                              ),
                              _buildServiceBox(
                                context,
                                imagePath: 'assets/images/washing_machine.jpg',
                                label: 'Washing Machine',
                                boxWidth: screenWidth * 0.2,
                              ),
                              _buildServiceBox(
                                context,
                                imagePath: 'assets/images/television.jpg',
                                label: 'Television',
                                boxWidth: screenWidth * 0.2,
                              ),
                              _buildServiceBox(
                                context,
                                imagePath: 'assets/images/laptop.jpg',
                                label: 'Laptop',
                                boxWidth: screenWidth * 0.2,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildServiceBox(
                                context,
                                imagePath: 'assets/images/air_cooler.jpg',
                                label: 'Air Cooler',
                                boxWidth: screenWidth * 0.2,
                              ),
                              const SizedBox(width: 12),
                              _buildServiceBox(
                                context,
                                imagePath: 'assets/images/geyser.jpg',
                                label: 'Geyser',
                                boxWidth: screenWidth * 0.2,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Kitchen appliances',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildServiceBox(
                                context,
                                imagePath: 'assets/images/water_purifier.jpg',
                                label: 'Water Purifier',
                                boxWidth: screenWidth * 0.2,
                              ),
                              _buildServiceBox(
                                context,
                                imagePath: 'assets/images/refrigerator.jpg',
                                label: 'Refrigerator',
                                boxWidth: screenWidth * 0.2,
                              ),
                              _buildServiceBox(
                                context,
                                imagePath: 'assets/images/stove.jpg',
                                label: 'Stove',
                                boxWidth: screenWidth * 0.2,
                              ),
                              _buildServiceBox(
                                context,
                                imagePath: 'assets/images/microwave.jpg',
                                label: 'Microwave',
                                boxWidth: screenWidth * 0.2,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildServiceBox(
                                context,
                                imagePath: 'assets/images/chimney.jpg',
                                label: 'Chimney',
                                boxWidth: screenWidth * 0.2,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Buy Native products',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildServiceBox(
                                context,
                                imagePath: 'assets/images/native_water_purifier.jpg',
                                label: 'Native Water Purifier',
                                boxWidth: screenWidth * 0.2,
                              ),
                              const SizedBox(width: 12),
                              _buildServiceBox(
                                context,
                                imagePath: 'assets/images/native_smart_locks.jpg',
                                label: 'Native Smart Locks',
                                boxWidth: screenWidth * 0.2,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        // Floating Cancel Button (Smaller, Fixed in Top-Right Corner)
        Positioned(
          right: 16,
          top: -60, // Fixed at top-right corner, outside the sheet
          child: FloatingActionButton.small(
            onPressed: () {
              Navigator.of(context).pop(); // Closes the sheet
            },
            backgroundColor: Colors.white,
            shape: const CircleBorder(), // Ensures round shape
            elevation: 2,
            child: const Icon(
              Icons.close,
              color: Colors.black,
              size: 20, // Slightly smaller icon to fit smaller button
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildServiceBox(BuildContext context, {required String imagePath, required String label, required double boxWidth}) {
    return InkWell(
      onTap: () {
        print('Tapped on $label');
      },
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          Container(
            height: 90,
            width: boxWidth,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.white, Colors.grey],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              border: Border.all(color: Colors.grey[300]!, width: 1),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
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
            height: 32,
            width: boxWidth,
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