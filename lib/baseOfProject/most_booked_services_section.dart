import 'package:flutter/material.dart';

class MostBookedServicesSection extends StatelessWidget {
  final double screenWidth;

  const MostBookedServicesSection({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Most booked services",
                  style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  child: Row(
                    children: List.generate(10, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: SizedBox(
                          width: screenWidth * 0.35,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                width: screenWidth * 0.35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey[300],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'assets/images/service${index + 1}.jpg',
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[200],
                                        child: const Icon(Icons.broken_image, color: Colors.grey, size: 24),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                index == 0
                                    ? "Pest control (includes utens..."
                                    : index == 1
                                    ? "Apartment pest control (include..."
                                    : index == 2
                                    ? "At-home consultation"
                                    : "Service ${index + 1}",
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.black, size: 16),
                                  const SizedBox(width: 4),
                                  Text(
                                    index == 0
                                        ? "4.80 (310K)"
                                        : index == 1
                                        ? "4.80 (310K)"
                                        : index == 2
                                        ? "4.79 (46K)"
                                        : "4.50 (${(index + 1) * 10}K)",
                                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                index == 0
                                    ? "₹1,498"
                                    : index == 1
                                    ? "₹1,498"
                                    : index == 2
                                    ? "₹49"
                                    : "₹${(index + 1) * 100}",
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }
}