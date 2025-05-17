import 'package:flutter/material.dart';
import '../subPagesOf6Box/subSubPages/salonRoyale.dart';

class SalonForMenPage extends StatelessWidget {
  const SalonForMenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Salon for Men'),
        actions: const [Icon(Icons.share)],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 30.0, right: 0.0, bottom: 10.0),
              child: Text(
                'Select your preference',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildSeparator(),
            _buildCategoryCard(
              context,
              imagePath: 'assets/images/men_royale.jpg',
              title: 'Royale',
              description: 'Luxury - Inoa, Repechage, O3+',
            ),
            _buildSeparator(),
            _buildCategoryCard(
              context,
              imagePath: 'assets/images/men_prime.jpg',
              title: 'Prime',
              description: 'Economical - L\'Oréal, Bombay Shaving Company, O3+',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSeparator() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Divider(color: Colors.black12),
    );
  }

  Widget _buildCategoryCard(
      BuildContext context, {
        required String imagePath,
        required String title,
        required String description,
      }) {
    return InkWell(
      onTap: () {
        if (title == 'Royale') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SubFullWomenSalonRoyal(title: "Royale",),
            ),
          );
        } else if (title == 'Prime') {
          // Placeholder for Prime navigation or feedback
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Salon Prime is not available yet.'),
              duration: const Duration(seconds: 2),
            ),
          );
        } else {
          // Fallback for unexpected cases
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Unknown category: $title'),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
          ],
        ),
      ),
    );
  }
}