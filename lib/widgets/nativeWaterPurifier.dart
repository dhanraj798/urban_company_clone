import 'package:flutter/material.dart';

class NativeWaterPurifier extends StatefulWidget {
  const NativeWaterPurifier({super.key});

  @override
  State<NativeWaterPurifier> createState() => _NativeWaterPurifierState();
}

class _NativeWaterPurifierState extends State<NativeWaterPurifier> {
  int totalQuantity = 0; // To track total quantity across all ProductCards

  // Callback function to update total quantity
  void updateTotalQuantity(int change) {
    setState(() {
      totalQuantity += change;
      if (totalQuantity < 0) totalQuantity = 0; // Prevent negative quantity
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 1,
        shadowColor: Colors.white,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Native Water Purifier",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE7F5EC),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.green, size: 16),
                        SizedBox(width: 4),
                        Text("4.84", style: TextStyle(fontWeight: FontWeight.w600)),
                        SizedBox(width: 4),
                        Text("96K reviews", style: TextStyle(fontSize: 13)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(
                  thickness: 0.8, // slightly bolder for better visibility
                  color: Colors.black12,
                  height: 1, // optional: reduces extra vertical spacing
                ),
                const SizedBox(height: 16),
                // Horizontal Slider
                SizedBox(
                  height: 300, // Increased height to avoid overflow
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      ProductCard(
                        imagePath: 'assets/images/native.jpg',
                        title: 'Native M2',
                        price: 18499,
                        rating: '4.83',
                        reviews: '40K',
                        onQuantityChanged: updateTotalQuantity, // Pass callback
                      ),
                      ProductCard(
                        imagePath: 'assets/images/native.jpg',
                        title: 'Native M1',
                        price: 14499,
                        rating: '4.85',
                        reviews: '57K',
                        onQuantityChanged: updateTotalQuantity, // Pass callback
                      ),
                      ProductCard(
                        imagePath: 'assets/images/native.jpg',
                        title: 'Native Mini M2',
                        price: 1999,
                        rating: '4.87',
                        reviews: '12K',
                        onQuantityChanged: updateTotalQuantity, // Pass callback
                      ),
                    ],
                  ),
                ),
                // Best Price to Get Native RO Section
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Best price to get Native RO",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 35),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "M2 at ₹17,749",
                            style: TextStyle(fontSize: 16),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE7F5EC),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              "Extra ₹750 off",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Use \"NATIVE\"",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 1,
                        color: Colors.black12,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "M1 at ₹13,749",
                            style: TextStyle(fontSize: 16),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE7F5EC),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              "Extra ₹750 off",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Use \"NATIVE\"",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      const SizedBox(height: 16),
                      // EMI Information Section
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 1),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Pay easy with EMI',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Expanded(
                                        child: Divider(
                                          color: Colors.grey,
                                          thickness: 1,
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 80, // enough space for 4 overlapping avatars
                                        height: 24,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              child: CircleAvatar(
                                                radius: 12,
                                                backgroundImage: AssetImage('assets/images/bank1.png'),
                                              ),
                                            ),
                                            Positioned(
                                              left: 16,
                                              child: CircleAvatar(
                                                radius: 12,
                                                backgroundImage: AssetImage('assets/images/bank2.png'),
                                              ),
                                            ),
                                            Positioned(
                                              left: 32,
                                              child: CircleAvatar(
                                                radius: 12,
                                                backgroundImage: AssetImage('assets/images/bank3.png'),
                                              ),
                                            ),
                                            Positioned(
                                              left: 48,
                                              child: CircleAvatar(
                                                radius: 12,
                                                backgroundImage: AssetImage('assets/images/bank4.png'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      const Expanded(
                                        child: Text(
                                          'EMI available on all leading banks',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Add extra padding at the bottom to avoid overlap with Proceed button
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Proceed Button (Visible only if totalQuantity > 0)
          if (totalQuantity > 0)
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the next page, passing the total quantity
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlaceholderNextPage(totalQuantity: totalQuantity),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Proceed',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// Placeholder for the next page (to be implemented later)
class PlaceholderNextPage extends StatelessWidget {
  final int totalQuantity;

  const PlaceholderNextPage({super.key, required this.totalQuantity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: Center(
        child: Text('Total Quantity: $totalQuantity'),
      ),
    );
  }
}



class ProductCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final int price;
  final String rating;
  final String reviews;
  final Function(int) onQuantityChanged; // Callback to notify parent

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.onQuantityChanged, // Add callback parameter
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int quantity = 0;

  void _increment() {
    setState(() {
      quantity++;
      widget.onQuantityChanged(1); // Notify parent of increment
    });
  }

  void _decrement() {
    setState(() {
      if (quantity > 0) {
        quantity--;
        widget.onQuantityChanged(-1); // Notify parent of decrement
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = (screenWidth - 56) / 2;

    return Container(
      width: cardWidth,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section
          Container(
            height: 160,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(
                        Icons.broken_image,
                        color: Colors.grey,
                        size: 50,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // Info section
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 2),
                Text(
                  '₹${widget.price}',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.green),
                    const SizedBox(width: 4),
                    Text(
                      widget.rating,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '(${widget.reviews} reviews)',
                      style: const TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: quantity == 0
                      ? ElevatedButton(
                    onPressed: _increment,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Set background to white
                      foregroundColor: Colors.deepPurpleAccent, // This affects ripple color on press
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                        side: BorderSide(color: Colors.grey.shade300), // Add gray border
                      ),
                    ),
                    child: const Text(
                      'Add',
                      style: TextStyle(color: Colors.deepPurpleAccent), // Set text color to purple
                    ),
                  )
                      : Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: _decrement,
                          icon: const Icon(Icons.remove),
                          iconSize: 18,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                        ),
                        Text(
                          '$quantity',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: _increment,
                          icon: const Icon(Icons.add),
                          iconSize: 18,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}