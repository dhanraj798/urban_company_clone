import 'package:flutter/material.dart';

class ServiceDetailPage extends StatelessWidget {
  final String title;

  const ServiceDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return DraggableScrollableSheet(
      initialChildSize: 0.3, // Default height: 30% of screen
      minChildSize: 0.3, // Minimum height: 30%
      maxChildSize: 0.9, // Maximum height: 90% (to avoid covering status bar)
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
                  // Title at top-left
                  Text(
                    title.isEmpty ? 'Service Details' : title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Placeholder content (3 icons with text, matching the image)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildServiceIcon(
                        context,
                        icon: Icons.face, // Placeholder icon (face mask)
                        label: 'Salon for Women',
                      ),
                      _buildServiceIcon(
                        context,
                        icon: Icons.local_hospital, // Placeholder icon (massage table)
                        label: 'Spa for Women',
                      ),
                      _buildServiceIcon(
                        context,
                        icon: Icons.brush, // Placeholder icon (hair dryer)
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
    );
  }

  Widget _buildServiceIcon(BuildContext context, {required IconData icon, required String label}) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            size: 30,
            color: Colors.black54,
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
              color: Colors.black,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}