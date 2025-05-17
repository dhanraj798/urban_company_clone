import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

class SubFullWomenSalonRoyal extends StatefulWidget {
  final String title;

  const SubFullWomenSalonRoyal({super.key, required this.title});

  @override
  _SubFullWomenSalonRoyalState createState() => _SubFullWomenSalonRoyalState();
}

class _SubFullWomenSalonRoyalState extends State<SubFullWomenSalonRoyal> {
  bool _showFloatingBox = false;
  final ScrollController _scrollController = ScrollController();
  late VideoPlayerController _videoController;
  bool _isVideoInitialized = false;

  final Map<String, GlobalKey> _sectionKeys = {
    'Packages': GlobalKey(),
    'Waxing': GlobalKey(),
    'Facial': GlobalKey(),
    'Korean Facial': GlobalKey(),
    'Cleanup': GlobalKey(),
    'Pedicure & Manicure': GlobalKey(),
    'Threading & Face Wax': GlobalKey(),
    'Bleach, Detan & Massage': GlobalKey(),
  };

  final List<Map<String, String>> services = [
    {'label': 'Packages', 'image': 'assets/images/packageBox.jpg'},
    {'label': 'Waxing', 'image': 'assets/images/legsWaxing.jpg'},
    {'label': 'Facial', 'image': 'assets/images/facial.jpg'},
    {'label': 'Korean Facial', 'image': 'assets/images/koreanFacial.jpg'},
    {'label': 'Cleanup', 'image': 'assets/images/cleanUp.jpg'},
    {'label': 'Pedicure & Manicure', 'image': 'assets/images/padicure&Manicure.jpg'},
    {'label': 'Threading & Face Wax', 'image': 'assets/images/threading&Wax.jpg'},
    {'label': 'Bleach, Detan & Massage', 'image': 'assets/images/bleach,detan&massage.jpg'},
  ];

  final Map<String, int> _serviceCounts = {
  'Royal Haircut & Glow': 0,
  'Royal Hair Spa & Shine': 0,
  'Haircut & Glam': 0,
  'Full Legs Smooth': 0,
  'Arms Silky': 0,
  'Radiance Facial': 0,
  'Moisture Boost Facial': 0,
  'Korean Radiance Glow': 0,
  'Korean Moisture Bliss': 0,
  'Quick Cleanup': 0,
  'Deep Refresh': 0,
  'Luxury Pedicure': 0,
  'Elegant Manicure': 0,
  'Brow Shaping': 0,
  'Face Smooth': 0,
  'Glow Bleach': 0,
  'Tan Removal Pack': 0,
  'Serenity Massage': 0,
};

final Map<String, double> _servicePrices = {
  'Royal Haircut & Glow': 1599,
  'Royal Hair Spa & Shine': 1449,
  'Haircut & Glam': 599,
  'Full Legs Smooth': 799,
  'Arms Silky': 599,
  'Radiance Facial': 1199,
  'Moisture Boost Facial': 1499,
  'Korean Radiance Glow': 1799,
  'Korean Moisture Bliss': 1999,
  'Quick Cleanup': 499,
  'Deep Refresh': 799,
  'Luxury Pedicure': 699,
  'Elegant Manicure': 599,
  'Brow Shaping': 99,
  'Face Smooth': 299,
  'Glow Bleach': 399,
  'Tan Removal Pack': 599,
  'Serenity Massage': 999,
};

final Map<String, double> _originalPrices = {
  'Royal Haircut & Glow': 1799,
  'Royal Hair Spa & Shine': 1649,
  'Haircut & Glam': 899,
  'Full Legs Smooth': 849,
  'Arms Silky': 649,
  'Radiance Facial': 1299,
  'Moisture Boost Facial': 1599,
  'Korean Radiance Glow': 1899,
  'Korean Moisture Bliss': 2099,
  'Quick Cleanup': 549,
  'Deep Refresh': 849,
  'Luxury Pedicure': 749,
  'Elegant Manicure': 649,
  'Brow Shaping': 119,
  'Face Smooth': 349,
  'Glow Bleach': 449,
  'Tan Removal Pack': 649,
  'Serenity Massage': 1099,
};

final Map<String, String> _serviceHeadings = {
  'Royal Haircut & Glow': 'Packages',
  'Royal Hair Spa & Shine': 'Packages',
  'Haircut & Glam': 'Packages',
  'Full Legs Smooth': 'Waxing',
  'Arms Silky': 'Waxing',
  'Radiance Facial': 'Facial',
  'Moisture Boost Facial': 'Facial',
  'Korean Radiance Glow': 'Korean Facial',
  'Korean Moisture Bliss': 'Korean Facial',
  'Quick Cleanup': 'Cleanup',
  'Deep Refresh': 'Cleanup',
  'Luxury Pedicure': 'Pedicure & Manicure',
  'Elegant Manicure': 'Pedicure & Manicure',
  'Brow Shaping': 'Threading & Face Wax',
  'Face Smooth': 'Threading & Face Wax',
  'Glow Bleach': 'Bleach, Detan & Massage',
  'Tan Removal Pack': 'Bleach, Detan & Massage',
  'Serenity Massage': 'Bleach, Detan & Massage',
};

@override
void initState() {
  super.initState();
  _videoController = VideoPlayerController.asset('assets/videos/salonRoyal.mp4')
    ..initialize().then((_) {
      setState(() {
        _isVideoInitialized = true;
      });
      _videoController.setLooping(true);
      _videoController.play();
    }).catchError((error) {
      print('Video nahi chala bhai, error hai: $error');
    });
}

@override
void dispose() {
  _videoController.dispose();
  _scrollController.dispose();
  super.dispose();
}

void _toggleFloatingBox() {
  setState(() {
    _showFloatingBox = !_showFloatingBox;
  });
}

void _scrollToSection(String label) {
  final key = _sectionKeys[label];
  if (key != null && key.currentContext != null) {
    final RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero).dy + _scrollController.offset - 100;
    _scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
  if (_showFloatingBox) {
    _toggleFloatingBox();
  }
}

void _incrementCount(String serviceName) {
  setState(() {
    _serviceCounts[serviceName] = (_serviceCounts[serviceName] ?? 0) + 1;
  });
}

void _decrementCount(String serviceName) {
  setState(() {
    if (_serviceCounts[serviceName]! > 0) {
      _serviceCounts[serviceName] = _serviceCounts[serviceName]! - 1;
    }
  });
}

double _calculateTotalAmount() {
  double total = 0;
  _serviceCounts.forEach((serviceName, count) {
    total += (_servicePrices[serviceName] ?? 0) * count;
  });
  return total;
}

double _calculateOriginalTotal() {
  double total = 0;
  _serviceCounts.forEach((serviceName, count) {
    total += (_originalPrices[serviceName] ?? 0) * count;
  });
  return total;
}

int _getTotalItems() {
  return _serviceCounts.values.fold(0, (sum, count) => sum + count);
}

List<Map<String, dynamic>> _prepareCartData() {
  List<Map<String, dynamic>> cartItems = [];
  _serviceCounts.forEach((serviceName, count) {
    if (count > 0) {
      cartItems.add({
        'heading': _serviceHeadings[serviceName] ?? 'Unknown',
        'subheading': serviceName,
        'count': count,
        'price': _servicePrices[serviceName] ?? 0.0,
        'originalPrice': _originalPrices[serviceName] ?? 0.0,
      });
    }
  });
  return cartItems;
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    extendBodyBehindAppBar: true,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        'Try skin analysis',
        style: TextStyle(color: Colors.black, fontSize: 17),
      ),
      centerTitle: false,
      actions: const [
        Icon(Icons.search, color: Colors.black),
        SizedBox(width: 16),
        Icon(Icons.share, color: Colors.black),
        SizedBox(width: 16),
      ],
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: FloatingActionButton.extended(
      onPressed: _toggleFloatingBox,
      label: const Text(
        "Menu",
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
      icon: const Icon(
        Icons.menu,
        color: Colors.white,
        size: 10,
      ),
      backgroundColor: Colors.black,
      extendedPadding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    bottomNavigationBar: _getTotalItems() > 0
        ? Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '₹${_calculateTotalAmount().toInt()} ₹${_calculateOriginalTotal().toInt()}',
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
                Navigator.pushNamed(
                  context,
                  '/cart',
                  arguments: _prepareCartData(),
                );
              },
              child: const Text(
                'View Cart',
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ),
        ],
      ),
    )
        : null,
    body: Stack(
      children: [
        SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: _isVideoInitialized
                                ? VideoPlayer(_videoController)
                                : const Center(child: CircularProgressIndicator()),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Salon ${widget.title}',
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.black, size: 16),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text('4.92 (1.5M bookings)',
                                      style: const TextStyle(color: Colors.black87)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.camera_outdoor_outlined),
                                      SizedBox(width: 8),
                                      Text('Try advanced skin analysis'),
                                    ],
                                  ),
                                  Icon(Icons.arrow_forward_ios, size: 16),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 50,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  _buildOfferBox(
                                    "Save 15% on every booking",
                                    "Get Royal Plus now",
                                    SvgPicture.asset(
                                      'assets/icons/discount-solid-svgrepo-com.svg',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  _buildOfferBox(
                                    "Cashback upto ₹75",
                                    "Via Paytm",
                                    const Icon(Icons.discount_rounded,
                                        size: 24, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                      Container(height: 8, color: Colors.grey.shade200),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            double availableWidth = constraints.maxWidth - 16;
                            double itemWidth = availableWidth / 4;
                            double aspectRatio = itemWidth / (itemWidth + 55);

                            return GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 12,
                                childAspectRatio: aspectRatio,
                              ),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(8),
                              itemCount: services.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () =>
                                      _scrollToSection(services[index]['label']!),
                                  child: _buildServiceBox(
                                    services[index]['label']!,
                                    services[index]['image']!,
                                    itemWidth,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Packages Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(color: Colors.grey.shade300),
                            const SizedBox(height: 8),
                            Text(
                              'Packages',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              key: _sectionKeys['Packages'],
                            ),
                            const SizedBox(height: 16),
                            _buildServiceBoxForSection(
                              'Royal Haircut & Glow',
                              '4.85 (120K reviews)',
                              1599,
                              1799,
                              '1 hr 50 mins',
                              [
                                'Hair care: Kerastase glow treatment',
                                'Haircut: Precision cut',
                              ],
                              'PACKAGE',
                              'assets/images/haircut_glow.jpg',
                            ),
                            const SizedBox(height: 16),
                            _buildServiceBoxForSection(
                              'Royal Hair Spa & Shine',
                              '4.86 (110K reviews)',
                              1449,
                              1649,
                              '1 hr 40 mins',
                              [
                                'Hair care: Kerastase shine spa',
                                'Styling: Glam blow-dry',
                              ],
                              'PACKAGE',
                              'assets/images/hair_spa_shine.jpg',
                            ),
                            const SizedBox(height: 16),
                            _buildServiceBoxForSection(
                              'Haircut & Glam',
                              '4.83 (180K reviews)',
                              599,
                              899,
                              '1 hr 20 mins',
                              [
                                'Haircut: Trendy cut',
                                'Styling: Curl or straight blow-dry',
                              ],
                              'PACKAGE',
                              'assets/images/haircut_glam.jpg',
                            ),
                            const SizedBox(height: 8),
                            Divider(color: Colors.grey.shade300),
                          ],
                        ),
                      ),
                      // Waxing Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(color: Colors.grey.shade300),
                            const SizedBox(height: 8),
                            Text(
                              'Waxing',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              key: _sectionKeys['Waxing'],
                            ),
                            const SizedBox(height: 16),
                            _buildServiceBoxForSection(
                              'Full Legs Smooth',
                              '4.87 (310K reviews)',
                              799,
                              849,
                              '40 mins',
                              [
                                'Waxing: Full legs - RICA premium',
                              ],
                              'WAXING',
                              'assets/images/legsWaxing.jpg',
                            ),
                            const SizedBox(height: 16),
                            _buildServiceBoxForSection(
                              'Arms Silky',
                              '4.82 (260K reviews)',
                              599,
                              649,
                              '25 mins',
                              [
                                'Waxing: Full arms - RICA premium',
                              ],
                              'WAXING',
                              'assets/images/legsWaxing.jpg',
                            ),
                            const SizedBox(height: 8),
                            Divider(color: Colors.grey.shade300),
                          ],
                        ),
                      ),
                      // Facial Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(color: Colors.grey.shade300),
                            const SizedBox(height: 8),
                            Text(
                              'Facial',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              key: _sectionKeys['Facial'],
                            ),
                            const SizedBox(height: 16),
                            _buildServiceBoxForSection(
                              'Radiance Facial',
                              '4.91 (210K reviews)',
                              1199,
                              1299,
                              '1 hr 5 mins',
                              [
                                'Facial: Glow enhancing treatment',
                                'Includes: Cleansing, scrub, massage',
                              ],
                              'FACIAL',
                              'assets/images/facial.jpg',
                            ),
                            const SizedBox(height: 16),
                            _buildServiceBoxForSection(
                              'Moisture Boost Facial',
                              '4.89 (190K reviews)',
                              1499,
                              1599,
                              '1 hr 20 mins',
                              [
                                'Facial: Intense hydration therapy',
                                'Includes: Cleansing, mask, hydration',
                              ],
                              'FACIAL',
                              'assets/images/facial.jpg',
                            ),
                            const SizedBox(height: 8),
                            Divider(color: Colors.grey.shade300),
                          ],
                        ),
                      ),
                      // Korean Facial Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(color: Colors.grey.shade300),
                            const SizedBox(height: 8),
                            Text(
                              'Korean Facial',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              key: _sectionKeys['Korean Facial'],
                            ),
                            const SizedBox(height: 16),
                            _buildServiceBoxForSection(
                              'Korean Radiance Glow',
                              '4.93 (160K reviews)',
                              1799,
                              1899,
                              '1 hr 35 mins',
                              [
                                'Facial: Korean crystal skin therapy',
                                'Includes: Double cleanse, peel, essence',
                              ],
                              'KOREAN FACIAL',
                              'assets/images/koreanFacial.jpg',
                            ),
                            const SizedBox(height: 16),
                            _buildServiceBoxForSection(
                              'Korean Moisture Bliss',
                              '4.91 (150K reviews)',
                              1999,
                              2099,
                              '1 hr 50 mins',
                              [
                                'Facial: Korean ultra-hydration',
                                'Includes: Double cleanse, mask, serum',
                              ],
                              'KOREAN FACIAL',
                              'assets/images/koreanFacial.jpg',
                            ),
                            const SizedBox(height: 8),
                            Divider(color: Colors.grey.shade300),
                          ],
                        ),
                      ),
                      // Cleanup Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(color: Colors.grey.shade300),
                            const SizedBox(height: 8),
                            Text(
                              'Cleanup',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              key: _sectionKeys['Cleanup'],
                            ),
                            const SizedBox(height: 16),
                            _buildServiceBoxForSection(
                              'Quick Cleanup',
                              '4.81 (110K reviews)',
                              499,
                              549,
                              '25 mins',
                              [
                                'Cleanup: Basic skin refresh',
                                'Includes: Cleansing, steam',
                              ],
                              'CLEANUP',
                              'assets/images/cleanUp.jpg',
                            ),
                            const SizedBox(height: 16),
                            _buildServiceBoxForSection(
                              'Deep Refresh',
                              '4.86 (130K reviews)',
                              799,
                              849,
                              '40 mins',
                              [
                                'Cleanup: Intense skin cleanse',
                                'Includes: Cleansing, steam, extraction',
                              ],
                              'CLEANUP',
                              'assets/images/cleanUp.jpg',
                            ),
                            const SizedBox(height: 8),
                            Divider(color: Colors.grey.shade300),
                          ],
                        ),
                      ),
                      // Pedicure & Manicure Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(color: Colors.grey.shade300),
                            const SizedBox(height: 8),
                            Text(
                              'Pedicure & Manicure',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              key: _sectionKeys['Pedicure & Manicure'],
                            ),
                            const SizedBox(height: 16),
                            _buildServiceBoxForSection(
                              'Luxury Pedicure',
                              '4.83 (100K reviews)',
                              699,
                              749,
                              '50 mins',
                              [
                                'Pedicure: Deluxe foot pamper',
                                'Includes: Soak, scrub, nail care',
                              ],
                              'PEDICURE',
                              'assets/images/padicure&Manicure.jpg',
                            ),
                            const SizedBox(height: 16),
                            _buildServiceBoxForSection(
                              'Elegant Manicure',
                              '4.81 (90K reviews)',
                              599,
                              649,
                              '45 mins',
                              [
                                'Manicure: Deluxe hand pamper',
                                'Includes: Soak, scrub, nail care',
                              ],
                              'MANICURE',
                              'assets/images/padicure&Manicure.jpg',
                            ),
                            const SizedBox(height: 8),
                            Divider(color: Colors.grey.shade300),
                          ],
                        ),
                      ),
                      // Threading & Face Wax Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(color: Colors.grey.shade300),
                            const SizedBox(height: 8),
                            Text(
                              'Threading & Face Wax',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              key: _sectionKeys['Threading & Face Wax'],
                            ),
                            const SizedBox(height: 16),
                            _buildServiceBoxForSection(
                              'Brow Shaping',
                              '4.91 (210K reviews)',
                              99,
                              119,
                              '15 mins',
                              [
                                'Threading: Precision brow sculpt',
                              ],
                              'THREADING',
                              'assets/images/threading&Wax.jpg',
                            ),
                            const SizedBox(height: 16),
                            _buildServiceBoxForSection(
                              'Face Smooth',
                              '4.86 (190K reviews)',
                              299,
                              349,
                              '25 mins',
                              [
                                'Waxing: Full face - Premium wax',
                              ],
                              'FACE WAX',
                              'assets/images/threading&Wax.jpg',
                            ),
                            const SizedBox(height: 8),
                            Divider(color: Colors.grey.shade300),
                          ],
                        ),
                      ),
                      // Bleach, Detan & Massage Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(color: Colors.grey.shade300),
                            const SizedBox(height: 8),
                            Text(
                              'Bleach, Detan & Massage',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              key: _sectionKeys['Bleach, Detan & Massage'],
                            ),
                            const SizedBox(height: 16),
                            _buildServiceBoxForSection(
                              'Glow Bleach',
                              '4.89 (160K reviews)',
                              399,
                              449,
                              '25 mins',
                              [
                                'Bleach: Face radiance boost',
                                'Includes: Application, cleanse',
                              ],
                              'BLEACH',
                              'assets/images/bleach,detan&massage.jpg',
                            ),
                            const SizedBox(height: 16),
                            _buildServiceBoxForSection(
                              'Tan Removal Pack',
                              '4.86 (140K reviews)',
                              599,
                              649,
                              '35 mins',
                              [
                                'Detan: Face and neck tan removal',
                                'Includes: Application, cleanse',
                              ],
                              'DETAN',
                              'assets/images/bleach,detan&massage.jpg',
                            ),
                            const SizedBox(height: 16),
                            _buildServiceBoxForSection(
                              'Serenity Massage',
                              '4.91 (150K reviews)',
                              999,
                              1099,
                              '1 hr 5 mins',
                              [
                                'Massage: Full body relaxation',
                                'Includes: Essential oil therapy',
                              ],
                              'MASSAGE',
                              'assets/images/bleach,detan&massage.jpg',
                            ),
                            const SizedBox(height: 8),
                            Divider(color: Colors.grey.shade300),
                          ],
                        ),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (_showFloatingBox)
          GestureDetector(
            onTap: _toggleFloatingBox,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 16),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            double availableWidth = constraints.maxWidth - 16;
                            double itemWidth = availableWidth / 4;
                            double aspectRatio = itemWidth / (itemWidth + 55);

                            return GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 12,
                                childAspectRatio: aspectRatio,
                              ),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(8),
                              itemCount: services.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () =>
                                      _scrollToSection(services[index]['label']!),
                                  child: _buildServiceBox(
                                    services[index]['label']!,
                                    services[index]['image']!,
                                    itemWidth,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    ),
  );
}

Widget _buildServiceBoxForSection(
    String title,
    String rating,
    double price,
    double originalPrice,
    String duration,
    List<String> services,
    String label,
    String imagePath) {
  final count = _serviceCounts[title] ?? 0;
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    label,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.black, size: 16),
                const SizedBox(width: 4),
                Text(rating, style: const TextStyle(fontSize: 14)),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  '₹${price.toInt()}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Text(
                  '₹${originalPrice.toInt()}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '• $duration',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...services.map((service) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(fontSize: 14)),
                  Expanded(
                      child: Text(service, style: const TextStyle(fontSize: 14))),
                ],
              ),
            )),
            const SizedBox(height: 8),
            const Text(
              'CUSTOMIZE PACKAGE',
              style: TextStyle(color: Colors.blue, fontSize: 12),
            ),
          ],
        ),
      ),
      Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: -8,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.purple),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: count == 0
                      ? TextButton(
                    onPressed: () => _incrementCount(title),
                    child: const Text(
                      'Add',
                      style: TextStyle(color: Colors.purple, fontSize: 12),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      minimumSize: const Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  )
                      : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () => _decrementCount(title),
                        child: const Icon(
                          Icons.remove,
                          size: 12,
                          color: Colors.purple,
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          minimumSize: const Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        color: Colors.grey.shade200,
                        child: Text('$count', style: const TextStyle(fontSize: 12)),
                      ),
                      TextButton(
                        onPressed: () => _incrementCount(title),
                        child: const Icon(
                          Icons.add,
                          size: 12,
                          color: Colors.purple,
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          minimumSize: const Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    ],
  );
}

static Widget _buildOfferBox(String title, String subtitle, Widget icon) {
return Container(
width: 220,
height: 50,
padding: const EdgeInsets.symmetric(horizontal: 12),
decoration: BoxDecoration(
color: Colors.white,
border: Border.all(color: Colors.black12),
borderRadius: BorderRadius.circular(12),
),
child: Row(
children: [
icon,
const SizedBox(width: 10),
Expanded(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
title,
style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
overflow: TextOverflow.ellipsis,
maxLines: 1,
),
Text(
subtitle,
style: const TextStyle(fontSize: 11, color: Colors.black54),
overflow: TextOverflow.ellipsis,
maxLines: 1,
),
],
),
),
],
),
);
}

Widget _buildServiceBox(String label, String iconPath, double itemWidth) {
  return SizedBox(
    width: itemWidth,
    child: Column(
      children: [
        SizedBox(
          height: itemWidth,
          width: itemWidth,
          child: Image.asset(
            iconPath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.red,
                child: Center(
                  child: Text(
                    'Image Failed: $label',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 4),
        Flexible(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
}