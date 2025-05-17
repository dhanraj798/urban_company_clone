import 'package:flutter/material.dart';

class ServiceBox extends StatelessWidget {
  final String imagePath;
  final String title;
  final Function(String) onTap;

  const ServiceBox({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(title),
        child: Container(
          height: 110, // Fixed height for alignment
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity, // Dynamic width
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.broken_image,
                          color: Colors.grey,
                          size: 24,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                height: 24, // Fixed height for title
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                  maxLines: 1, // Single line
                  overflow: TextOverflow.ellipsis, // Cut long text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WideServiceBox extends StatelessWidget {
  final String imagePath;
  final String title;
  final Function(String) onTap;

  const WideServiceBox({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(title),
        child: Container(
          height: 110, // Same height as ServiceBox for alignment
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.broken_image,
                          color: Colors.grey,
                          size: 24,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                height: 24, // Fixed height for title
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                  maxLines: 1, // Single line
                  overflow: TextOverflow.ellipsis, // Cut long text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}