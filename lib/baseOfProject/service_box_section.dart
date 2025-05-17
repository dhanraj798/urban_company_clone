import 'package:flutter/material.dart';
import '../widgets/ServiceBox.dart';

class ServiceBoxSection extends StatelessWidget {
  final double screenWidth;
  final Function(String) onTap;

  const ServiceBoxSection({super.key, required this.screenWidth, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start, // Top-align boxes
              children: [
                ServiceBox(
                  imagePath: 'assets/images/womenSalon&Spa.jpg',
                  title: "Women's Salon & Spa",
                  onTap: onTap,
                ),
                ServiceBox(
                  imagePath: 'assets/images/menSalon&Massage.jpg',
                  title: "Men's Salon & Massage",
                  onTap: onTap,
                ),
                ServiceBox(
                  imagePath: 'assets/images/Ac&ApplianceRepair.jpg',
                  title: "AC & Appliance Repair",
                  onTap: onTap,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start, // Top-align boxes
              children: [
                ServiceBox(
                  imagePath: 'assets/images/cleaning&PestControl.jpg',
                  title: "Cleaning & Pest Control",
                  onTap: onTap,
                ),
                ServiceBox(
                  imagePath: 'assets/images/ElectricianPlumber.jpg',
                  title: "Electrician, Plumber & Carpenter",
                  onTap: onTap,
                ),
                ServiceBox(
                  imagePath: 'assets/images/nativeWaterPurifier.jpg',
                  title: "Native Water Purifier",
                  onTap: onTap,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start, // Top-align boxes
              children: [
                WideServiceBox(
                  imagePath: 'assets/images/nativeSmartLock.jpg',
                  title: "Native Smart Locks",
                  onTap: onTap,
                ),
                WideServiceBox(
                  imagePath: 'assets/images/painting&WaterProofing.jpg', // Fixed space in path
                  title: "Painting & Waterproofing",
                  onTap: onTap,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(height: 8, color: Colors.grey[300]),
        ],
      ),
    );
  }
}