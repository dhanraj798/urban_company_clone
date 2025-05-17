import 'package:flutter/material.dart';
import './subSubPages/SpaAyurveda.dart';

class SpaForWomenPage extends StatelessWidget {
  const SpaForWomenPage({super.key});

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
        title: const Text('Spa for Women'),
        actions: const [Icon(Icons.share)],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 30.0, right: 0.0, bottom: 10.0),
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
              imagePath: 'assets/images/image (3).jpg', // Assuming this matches "Ayurveda"
              title: 'Ayurveda',
              description: 'Experts in ancient techniques with herbal oils',
            ),
            _buildSeparator(),
            _buildCategoryCard(
              context,
              imagePath: 'assets/images/image (2).jpg', // Assuming this matches "Prime"
              title: 'Prime',
              description: 'Certified therapists & essential oils',
            ),
            _buildSeparator(),
            _buildCategoryCard(
              context,
              imagePath: 'assets/images/image (1).jpg', // Assuming this matches "Luxe"
              title: 'Luxe',
              description: 'High-rated therapists & premium-grade oils',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSeparator() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal:5.0),
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
        // You can uncomment and adjust navigation logic if needed
         Navigator.push(
           context,
           MaterialPageRoute(
             builder: (context) => SpaAyurveda(title: 'Ayurveda',),
           ),
         );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            Container(
              width: 100, // Adjusted to match the image's smaller thumbnail size
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