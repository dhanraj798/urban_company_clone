import 'package:flutter/material.dart';
import '../widgets/data.dart';

class NewAndNoteworthySection extends StatelessWidget {
  final double screenWidth;

  const NewAndNoteworthySection({super.key, required this.screenWidth});

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
                  "New and noteworthy",
                  style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100,
                        child: Row(
                          children: [
                            SizedBox(width: screenWidth * 0.02),
                            ...List.generate(5, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: SizedBox(
                                  width: screenWidth * 0.28,
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () => print('Tapped ${horizontalGridItems[index]['title']}'),
                                        child: Container(
                                          height: 80,
                                          width: screenWidth * 0.28,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: Colors.grey[300],
                                          ),
                                          child: Image.asset(
                                            horizontalGridItems[index]['image']!,
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
                                      const SizedBox(height: 4),
                                      Flexible(
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            horizontalGridItems[index]['title']!,
                                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: SizedBox(
                          height: 100,
                          child: Row(
                            children: [
                              SizedBox(width: screenWidth * 0.02),
                              ...List.generate(4, (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: SizedBox(
                                    width: screenWidth * 0.28,
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () => print('Tapped ${horizontalGridItems[index + 5]['title']}'),
                                          child: Container(
                                            height: 80,
                                            width: screenWidth * 0.28,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              color: Colors.grey[300],
                                            ),
                                            child: Image.asset(
                                              horizontalGridItems[index + 5]['image']!,
                                              fit: BoxFit.cover,
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
                                        const SizedBox(height: 4),
                                        Flexible(
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              horizontalGridItems[index + 5]['title']!,
                                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Container(height: 8, color: Colors.grey[300]),
        ],
      ),
    );
  }
}