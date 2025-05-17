import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

class SalonLuxe extends StatefulWidget {
  final String title;

  const SalonLuxe({super.key, required this.title});

  @override
  _SalonLuxeState createState() => _SalonLuxeState();
}

class _SalonLuxeState extends State<SalonLuxe> {
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
    'Complete Waxing (tin)': 0,
    'Complete Waxing (roll-on)': 0,
    'Waxing & Facial': 0,
    'Full Legs Waxing': 0,
    'Arms Waxing': 0,
    'Glow Facial': 0,
    'Hydrating Facial': 0,
    'Korean Glow Facial': 0,
    'Korean Hydrating Facial': 0,
    'Basic Cleanup': 0,
    'Deep Cleanup': 0,
    'Classic Pedicure': 0,
    'Classic Manicure': 0,
    'Eyebrow Threading': 0,
    'Face Wax': 0,
    'Face Bleach': 0,
    'Detan Pack': 0,
    'Relaxing Massage': 0,
  };

  final Map<String, double> _servicePrices = {
    'Complete Waxing (tin)': 1603,
    'Complete Waxing (roll-on)': 1812,
    'Waxing & Facial': 2100,
    'Full Legs Waxing': 800,
    'Arms Waxing': 600,
    'Glow Facial': 1200,
    'Hydrating Facial': 1500,
    'Korean Glow Facial': 1800,
    'Korean Hydrating Facial': 2000,
    'Basic Cleanup': 500,
    'Deep Cleanup': 800,
    'Classic Pedicure': 700,
    'Classic Manicure': 600,
    'Eyebrow Threading': 100,
    'Face Wax': 300,
    'Face Bleach': 400,
    'Detan Pack': 600,
    'Relaxing Massage': 1000,
  };

  final Map<String, double> _originalPrices = {
    'Complete Waxing (tin)': 1687,
    'Complete Waxing (roll-on)': 1907,
    'Waxing & Facial': 2200,
    'Full Legs Waxing': 850,
    'Arms Waxing': 650,
    'Glow Facial': 1300,
    'Hydrating Facial': 1600,
    'Korean Glow Facial': 1900,
    'Korean Hydrating Facial': 2100,
    'Basic Cleanup': 550,
    'Deep Cleanup': 850,
    'Classic Pedicure': 750,
    'Classic Manicure': 650,
    'Eyebrow Threading': 120,
    'Face Wax': 350,
    'Face Bleach': 450,
    'Detan Pack': 650,
    'Relaxing Massage': 1100,
  };

  final Map<String, String> _serviceHeadings = {
    'Complete Waxing (tin)': 'Packages',
    'Complete Waxing (roll-on)': 'Packages',
    'Waxing & Facial': 'Packages',
    'Full Legs Waxing': 'Waxing',
    'Arms Waxing': 'Waxing',
    'Glow Facial': 'Facial',
    'Hydrating Facial': 'Facial',
    'Korean Glow Facial': 'Korean Facial',
    'Korean Hydrating Facial': 'Korean Facial',
    'Basic Cleanup': 'Cleanup',
    'Deep Cleanup': 'Cleanup',
    'Classic Pedicure': 'Pedicure & Manicure',
    'Classic Manicure': 'Pedicure & Manicure',
    'Eyebrow Threading': 'Threading & Face Wax',
    'Face Wax': 'Threading & Face Wax',
    'Face Bleach': 'Bleach, Detan & Massage',
    'Detan Pack': 'Bleach, Detan & Massage',
    'Relaxing Massage': 'Bleach, Detan & Massage',
  };

  final Map<String, String> _serviceImages = {
    'Complete Waxing (tin)': 'assets/images/legsWaxing.jpg',
    'Complete Waxing (roll-on)': 'assets/images/legsWaxing.jpg',
    'Waxing & Facial': 'assets/images/facial.jpg',
    'Full Legs Waxing': 'assets/images/legsWaxing.jpg',
    'Arms Waxing': 'assets/images/legsWaxing.jpg',
    'Glow Facial': 'assets/images/facial.jpg',
    'Hydrating Facial': 'assets/images/facial.jpg',
    'Korean Glow Facial': 'assets/images/koreanFacial.jpg',
    'Korean Hydrating Facial': 'assets/images/koreanFacial.jpg',
    'Basic Cleanup': 'assets/images/cleanUp.jpg',
    'Deep Cleanup': 'assets/images/cleanUp.jpg',
    'Classic Pedicure': 'assets/images/padicure&Manicure.jpg',
    'Classic Manicure': 'assets/images/padicure&Manicure.jpg',
    'Eyebrow Threading': 'assets/images/threading&Wax.jpg',
    'Face Wax': 'assets/images/threading&Wax.jpg',
    'Face Bleach': 'assets/images/bleach,detan&massage.jpg',
    'Detan Pack': 'assets/images/bleach,detan&massage.jpg',
    'Relaxing Massage': 'assets/images/bleach,detan&massage.jpg',
  };

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/vedio/salonLuxe.mp4')
      ..initialize().then((_) {
        setState(() {
          _isVideoInitialized = true;
        });
        _videoController.setLooping(true);
        _videoController.play();
      }).catchError((error) {
        print('Video chal nahi raha bhai error hai : $error');
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
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
          size: 16,
        ),
        backgroundColor: Colors.black,
        extendedPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        extendedTextStyle: const TextStyle(
          fontSize: 12,
          height: 1.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
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
                                  const Icon(Icons.star, color: Colors.black, size: 16),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text('4.90 (1.2 M bookings)',
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
                                        Text('Try all new skin analysis'),
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
                                      "Save 10% on every order",
                                      "Get Plus now",
                                      SvgPicture.asset(
                                        'assets/icons/discount-solid-svgrepo-com.svg',
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    _buildOfferBox(
                                      "Amazon cashback upto ₹50",
                                      "Via Amazon Pay",
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
                                    onTap: () => _scrollToSection(services[index]['label']!),
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
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                key: _sectionKeys['Packages'],
                              ),
                              const SizedBox(height: 16),
                              _buildServiceBoxForSection(
                                'Complete Waxing (tin)',
                                '4.91 (449K reviews)',
                                1603,
                                1687,
                                '1 hr 25 mins',
                                [
                                  'Waxing: Full arms (including underarms) - RICA gold, Full legs - RICA gold',
                                  'Facial hair removal: Upper lip - Threading',
                                ],
                                'PACKAGE',
                                'assets/images/legsWaxing.jpg',
                              ),
                              const SizedBox(height: 16),
                              _buildServiceBoxForSection(
                                'Complete Waxing (roll-on)',
                                '4.91 (405K reviews)',
                                1812,
                                1907,
                                '1 hr 15 mins',
                                [
                                  'Waxing: Full legs - RICA gold roll-on, Full arms (including underarms) - RICA gold roll-on',
                                  'Facial hair removal: Upper lip - Threading',
                                ],
                                'PACKAGE',
                                'assets/images/legsWaxing.jpg',
                              ),
                              const SizedBox(height: 16),
                              _buildServiceBoxForSection(
                                'Waxing & Facial',
                                '4.91 (296K reviews)',
                                2100,
                                2200,
                                '1 hr 30 mins',
                                [
                                  'Waxing: Full arms - RICA gold',
                                  'Facial: Glow facial',
                                ],
                                'PACKAGE',
                                'assets/images/facial.jpg',
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
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                key: _sectionKeys['Waxing'],
                              ),
                              const SizedBox(height: 16),
                              _buildServiceBoxForSection(
                                'Full Legs Waxing',
                                '4.85 (300K reviews)',
                                800,
                                850,
                                '45 mins',
                                ['Waxing: Full legs - RICA gold'],
                                'WAXING',
                                'assets/images/legsWaxing.jpg',
                              ),
                              const SizedBox(height: 16),
                              _buildServiceBoxForSection(
                                'Arms Waxing',
                                '4.80 (250K reviews)',
                                600,
                                650,
                                '30 mins',
                                ['Waxing: Full arms - RICA gold'],
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
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                key: _sectionKeys['Facial'],
                              ),
                              const SizedBox(height: 16),
                              _buildServiceBoxForSection(
                                'Glow Facial',
                                '4.90 (200K reviews)',
                                1200,
                                1300,
                                '1 hr',
                                [
                                  'Facial: Brightening and glow treatment',
                                  'Includes: Cleansing, exfoliation, massage',
                                ],
                                'FACIAL',
                                'assets/images/facial.jpg',
                              ),
                              const SizedBox(height: 16),
                              _buildServiceBoxForSection(
                                'Hydrating Facial',
                                '4.88 (180K reviews)',
                                1500,
                                1600,
                                '1 hr 15 mins',
                                [
                                  'Facial: Deep hydration treatment',
                                  'Includes: Cleansing, mask, moisturizing',
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
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                key: _sectionKeys['Korean Facial'],
                              ),
                              const SizedBox(height: 16),
                              _buildServiceBoxForSection(
                                'Korean Glow Facial',
                                '4.92 (150K reviews)',
                                1800,
                                1900,
                                '1 hr 30 mins',
                                [
                                  'Facial: Korean glass skin treatment',
                                  'Includes: Double cleansing, exfoliation, essence',
                                ],
                                'KOREAN FACIAL',
                                'assets/images/koreanFacial.jpg',
                              ),
                              const SizedBox(height: 16),
                              _buildServiceBoxForSection(
                                'Korean Hydrating Facial',
                                '4.90 (140K reviews)',
                                2000,
                                2100,
                                '1 hr 45 mins',
                                [
                                  'Facial: Korean deep hydration treatment',
                                  'Includes: Double cleansing, mask, serum',
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
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                key: _sectionKeys['Cleanup'],
                              ),
                              const SizedBox(height: 16),
                              _buildServiceBoxForSection(
                                'Basic Cleanup',
                                '4.80 (100K reviews)',
                                500,
                                550,
                                '30 mins',
                                ['Cleanup: Basic face cleansing', 'Includes: Cleansing, steaming'],
                                'CLEANUP',
                                'assets/images/cleanUp.jpg',
                              ),
                              const SizedBox(height: 16),
                              _buildServiceBoxForSection(
                                'Deep Cleanup',
                                '4.85 (120K reviews)',
                                800,
                                850,
                                '45 mins',
                                [
                                  'Cleanup: Deep face cleansing',
                                  'Includes: Cleansing, steaming, extraction',
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
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                key: _sectionKeys['Pedicure & Manicure'],
                              ),
                              const SizedBox(height: 16),
                              _buildServiceBoxForSection(
                                'Classic Pedicure',
                                '4.82 (90K reviews)',
                                700,
                                750,
                                '45 mins',
                                [
                                  'Pedicure: Classic foot care',
                                  'Includes: Soaking, scrubbing, nail care',
                                ],
                                'PEDICURE',
                                'assets/images/padicure&Manicure.jpg',
                              ),
                              const SizedBox(height: 16),
                              _buildServiceBoxForSection(
                                'Classic Manicure',
                                '4.80 (85K reviews)',
                                600,
                                650,
                                '40 mins',
                                [
                                  'Manicure: Classic hand care',
                                  'Includes: Soaking, scrubbing, nail care',
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
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                key: _sectionKeys['Threading & Face Wax'],
                              ),
                              const SizedBox(height: 16),
                              _buildServiceBoxForSection(
                                'Eyebrow Threading',
                                '4.90 (200K reviews)',
                                100,
                                120,
                                '10 mins',
                                ['Threading: Eyebrow shaping'],
                                'THREADING',
                                'assets/images/threading&Wax.jpg',
                              ),
                              const SizedBox(height: 16),
                              _buildServiceBoxForSection(
                                'Face Wax',
                                '4.85 (180K reviews)',
                                300,
                                350,
                                '20 mins',
                                ['Waxing: Full face - Honey wax'],
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
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                key: _sectionKeys['Bleach, Detan & Massage'],
                              ),
                              const SizedBox(height: 16),
                              _buildServiceBoxForSection(
                                'Face Bleach',
                                '4.88 (150K reviews)',
                                400,
                                450,
                                '20 mins',
                                ['Bleach: Face brightening', 'Includes: Application, cleansing'],
                                'BLEACH',
                                'assets/images/bleach,detan&massage.jpg',
                              ),
                              const SizedBox(height: 16),
                              _buildServiceBoxForSection(
                                'Detan Pack',
                                '4.85 (130K reviews)',
                                600,
                                650,
                                '30 mins',
                                ['Detan: Face and neck detan', 'Includes: Application, removal'],
                                'DETAN',
                                'assets/images/bleach,detan&massage.jpg',
                              ),
                              const SizedBox(height: 16),
                              _buildServiceBoxForSection(
                                'Relaxing Massage',
                                '4.90 (140K reviews)',
                                1000,
                                1100,
                                '1 hr',
                                [
                                  'Massage: Full body relaxation',
                                  'Includes: Aromatherapy oil massage',
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
                                    onTap: () => _scrollToSection(services[index]['label']!),
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
      [String? imagePath]) {
    final count = _serviceCounts[title] ?? 0;
    final image = imagePath ?? _serviceImages[title] ?? 'assets/images/default.jpg';
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
                'EDIT YOUR PACKAGE',
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
                      image: AssetImage(image),
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