import 'package:flutter/material.dart';

class PaintingAndWaterproofing extends StatelessWidget {
  const PaintingAndWaterproofing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Painting & Waterproofing",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 8, right: 16, top: 24, bottom: 24), // Reduced left padding
        children: [
          const Text(
            "Painting & Waterproofing",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Select your scope",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),

          const Divider(
            height: 20,
            thickness: 0.9,
            color: Colors.black54,
          ),

          const SizedBox(height: 0),
          _buildImageTextRow(
            imagePath: 'assets/images/paintingPage_1.jpg',
            title: "Full home painting",
            subtitle: "1/2/3/4 BHK & above",
          ),

          const Divider(
            height: 20,
            thickness: 0.9,
            color: Colors.black54,
          ),


          _buildImageTextRow(
            imagePath: 'assets/images/paintingPage_1(2).jpg',
            title: "Few walls & rooms",
            subtitle: "Individual walls or 1/2/3 rooms",
          ),
        ],
      ),
    );
  }

  Widget _buildImageTextRow({
    required String imagePath,
    required String title,
    required String subtitle,
  }) {
    return InkWell(
      onTap: () {
       /* Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DummyNextPage()),
        );*/
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 16, top: 12, bottom: 12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 100,
                  height: 140,
                  color: Colors.grey[200],
                  child: Image.asset(
                    imagePath,
                    width: 100,
                    height: 140,
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
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
  }
