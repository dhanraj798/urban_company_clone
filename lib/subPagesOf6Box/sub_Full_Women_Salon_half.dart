import 'package:flutter/material.dart';
import './subSubPages/salonLuxe.dart';

class SalonForWomenPage extends StatelessWidget {
  const SalonForWomenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
          onPressed: (){
              Navigator.pop(context);
          },
        ),
        title: const Text('Salon for Women'),
        actions: const [Icon(Icons.share)],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 220,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildCategoryCard(
              context,
              imagePath: 'assets/images/image (1).jpg',
              title: 'Luxe',
              priceTag: '₹₹₹',
              level: 'LUXURY',
              brands: ['AINHOA', 'CASMARA', 'CIREPIL'],
            ),
            _buildSeparator(),
            _buildCategoryCard(
              context,
              imagePath: 'assets/images/image (2).jpg',
              title: 'Prime',
              priceTag: '₹₹',
              level: 'PREMIUM',
              brands: ['ELYSIAN', 'RICA', 'INVEDA'],
            ),
            _buildSeparator(),
            _buildCategoryCard(
              context,
              imagePath: 'assets/images/image (3).jpg',
              title: 'Classic',
              priceTag: '₹',
              level: 'ECONOMICAL',
              brands: ['VLCC', 'RICHELON', 'CRAVE'],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSeparator() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Divider(color: Colors.black45),
    );
  }

  Widget _buildCategoryCard(
      BuildContext context, {
        required String imagePath,
        required String title,
        required String priceTag,
        required String level,
        required List<String> brands,
      }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SalonLuxe(title: title),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            Container(
              width: 110,
              height: 150,
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
                  Text(title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(level,
                            style: const TextStyle(fontSize: 12)),
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 6,
                    children: brands
                        .map((b) =>
                        Text(b, style: const TextStyle(fontSize: 12)))
                        .toList(),
                  )
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios,
                size: 16, color: Colors.black54),
          ],
        ),
      ),
    );
  }
}
