import 'package:flutter/material.dart';

class YourCart extends StatelessWidget {
  const YourCart({super.key});

  @override
  Widget build(BuildContext context) {
    // Catch the cart data from route arguments
    final List<Map<String, dynamic>> cartItems =
    ModalRoute.of(context)!.settings.arguments as List<Map<String, dynamic>>;

    // Group items by heading
    Map<String, List<Map<String, dynamic>>> groupedItems = {};
    for (var item in cartItems) {
      final heading = item['heading'] as String;
      if (!groupedItems.containsKey(heading)) {
        groupedItems[heading] = [];
      }
      groupedItems[heading]!.add(item);
    }

    // Calculate totals
    double totalAmount = 0;
    double originalTotal = 0;
    for (var item in cartItems) {
      totalAmount += (item['price'] as double) * (item['count'] as int);
      originalTotal += (item['originalPrice'] as double) * (item['count'] as int);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        centerTitle: false,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '₹${totalAmount.toInt()} ₹${originalTotal.toInt()}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.grey,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple),
                borderRadius: BorderRadius.circular(4),
              ),
              child: TextButton(
                onPressed: () {
                  print('Proceed clicked');
                },
                child: const Text(
                  'Proceed',
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...groupedItems.entries.map((entry) {
                final heading = entry.key;
                final items = entry.value;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(color: Colors.grey.shade300),
                      const SizedBox(height: 8),
                      Text(
                        heading,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      ...items.map((item) {
                        final subheading = item['subheading'] as String;
                        final count = item['count'] as int;
                        final price = (item['price'] as double).toInt();
                        final originalPrice =
                        (item['originalPrice'] as double).toInt();
                        final label = heading.toUpperCase();
                        final subPoints = item['subPoints'] as List<String>;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    label,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  '$count item${count > 1 ? 's' : ''}',
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              subheading,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  '₹$price',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '₹$originalPrice',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            // Display sub-points with bullet points
                            if (subPoints.isNotEmpty) ...[
                              ...subPoints.map((subPoint) => Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('• ', style: TextStyle(fontSize: 14)),
                                    Expanded(
                                      child: Text(
                                        subPoint,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                            const SizedBox(height: 16),
                          ],
                        );
                      }).toList(),
                      const SizedBox(height: 8),
                      Divider(color: Colors.grey.shade300),
                    ],
                  ),
                );
              }).toList(),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}