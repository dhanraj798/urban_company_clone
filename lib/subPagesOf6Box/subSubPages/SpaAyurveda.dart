import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

class SpaAyurveda extends StatefulWidget {
  final String title;

  const SpaAyurveda({super.key, required this.title});

  @override
  _SpaAyurvedaState createState() => _SpaAyurvedaState();
}

class _SpaAyurvedaState extends State<SpaAyurveda> {
  bool _showFloatingBox = false;
  final ScrollController _scrollController = ScrollController();
  late VideoPlayerController _videoController;
  bool _isVideoInitialized = false;

  final Map<String, GlobalKey> _sectionKeys = {
    'Stress Relief': GlobalKey(),
    'Pain Relief': GlobalKey(),
    'Ayurvedic skin care': GlobalKey(),
    'Add-ons': GlobalKey(),
  };

  final List<Map<String, String>> services = [
    {'label': 'Stress Relief', 'image': 'assets/images/stressRelief.jpg'},
    {'label': 'Pain Relief', 'image': 'assets/images/painRelief.jpg'},
    {'label': 'Ayurvedic skin care', 'image': 'assets/images/ayurvedicSkinCare.jpg'},
    {'label': 'Add-ons', 'image': 'assets/images/addOns.jpg'},
  ];

  final Map<String, int> _serviceCounts = {
    'Detox Panchakarma': 0,
    'Full Body Abhyanga': 0,
    'Head & Shoulder Abhyanga': 0,
    'Shirodhara Therapy': 0,
    'Stress Relief Massage': 0,
    'Back Pain Relief': 0,
    'Joint Pain Relief': 0,
    'Ayurvedic Facial': 0,
    'Herbal Steam': 0,
  };

  final Map<String, double> _servicePrices = {
    'Detox Panchakarma': 2800,
    'Full Body Abhyanga': 2000,
    'Head & Shoulder Abhyanga': 1200,
    'Shirodhara Therapy': 2500,
    'Stress Relief Massage': 1800,
    'Back Pain Relief': 1500,
    'Joint Pain Relief': 1600,
    'Ayurvedic Facial': 1200,
    'Herbal Steam': 500,
  };

  final Map<String, double> _originalPrices = {
    'Detox Panchakarma': 3200,
    'Full Body Abhyanga': 2400,
    'Head & Shoulder Abhyanga': 1500,
    'Shirodhara Therapy': 2800,
    'Stress Relief Massage': 2100,
    'Back Pain Relief': 1800,
    'Joint Pain Relief': 1900,
    'Ayurvedic Facial': 1500,
    'Herbal Steam': 600,
  };

  final Map<String, String> _serviceHeadings = {
    'Detox Panchakarma': 'Stress Relief',
    'Full Body Abhyanga': 'Stress Relief',
    'Head & Shoulder Abhyanga': 'Stress Relief',
    'Shirodhara Therapy': 'Stress Relief',
    'Stress Relief Massage': 'Stress Relief',
    'Back Pain Relief': 'Pain Relief',
    'Joint Pain Relief': 'Pain Relief',
    'Ayurvedic Facial': 'Ayurvedic skin care',
    'Herbal Steam': 'Add-ons',
  };

  final Map<String, String> _serviceImages = {
    'Detox Panchakarma': 'assets/images/stressRelief.jpg',
    'Full Body Abhyanga': 'assets/images/stressRelief.jpg',
    'Head & Shoulder Abhyanga': 'assets/images/stressRelief.jpg',
    'Shirodhara Therapy': 'assets/images/ayurvedicSkinCare.jpg',
    'Stress Relief Massage': 'assets/images/ayurvedicSkinCare.jpg',
    'Back Pain Relief': 'assets/images/painRelief.jpg',
    'Joint Pain Relief': 'assets/images/painRelief.jpg',
    'Ayurvedic Facial': 'assets/images/ayurvedicSkinCare.jpg',
    'Herbal Steam': 'assets/images/painRelief.jpg',
  };

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/videos/spaAyurveda.mp4')
      ..initialize().then((_) {
        setState(() {
          _isVideoInitialized = true;
        });
        _videoController.setLooping(true);
        _videoController.play();
      }).catchError((error) {
        print('Video chal nahi raha bhai error hai: $error');
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
          'Try wellness analysis',
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
                              Text(
                                'Spa ${widget.title}',
                                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.black, size: 16),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      '4.95 (900K reviews)',
                                      style: const TextStyle(color: Colors.black87),
                                    ),
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
                                        Text('Try all new wellness analysis'),
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
                                      "Save 15% on every order",
                                      "Get Plus now",
                                      SvgPicture.asset(
                                        'assets/icons/discount-solid-svgrepo-com.svg',
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    _buildOfferBox(
                                      "Amazon cashback upto ₹100",
                                      "Via Amazon Pay",
                                      const Icon(Icons.discount_rounded, size: 24, color: Colors.black),
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
                          child: SizedBox(
                            height: 120,
                            child: Center(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: services.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                    child: GestureDetector(
                                      onTap: () => _scrollToSection(services[index]['label']!),
                                      child: _buildServiceBox(
                                        services[index]['label']!,
                                        services[index]['image']!,
                                        80,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Stress Relief Section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(color: Colors.grey.shade300),
                              const SizedBox(height: 8),
                              Text(
                                'Stress Relief',
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                key: _sectionKeys['Stress Relief'],
                              ),
                              const SizedBox(height: 16),
                              Divider(color: Colors.grey.shade300),
                              const SizedBox(height: 8),
                              _buildServiceBoxForSection(
                                'Detox Panchakarma',
                                '4.94 (450K reviews)',
                                2800,
                                3200,
                                '2 hrs 30 mins',
                                [
                                  'Therapy: Detox and cleansing',
                                  'Includes: Nasya, Raktamokshana',
                                ],
                                'PANCHAKARMA',
                                'assets/images/stressRelief.jpg',
                              ),
                              const SizedBox(height: 8),
                              Divider(color: Colors.grey.shade300),
                              const SizedBox(height: 8),
                              _buildServiceBoxForSection(
                                'Full Body Abhyanga',
                                '4.92 (400K reviews)',
                                2000,
                                2400,
                                '1 hr 30 mins',
                                [
                                  'Massage: Full body oil massage',
                                  'Includes: Herbal oils, steam therapy',
                                ],
                                'ABHYANGA',
                                'assets/images/stressRelief.jpg',
                              ),
                              const SizedBox(height: 8),
                              Divider(color: Colors.grey.shade300),
                              const SizedBox(height: 8),
                              _buildServiceBoxForSection(
                                'Head & Shoulder Abhyanga',
                                '4.90 (350K reviews)',
                                1200,
                                1500,
                                '45 mins',
                                [
                                  'Massage: Head and shoulder relaxation',
                                  'Includes: Medicated oils, gentle massage',
                                ],
                                'ABHYANGA',
                                'assets/images/stressRelief.jpg',
                              ),
                              const SizedBox(height: 8),
                              Divider(color: Colors.grey.shade300),
                              const SizedBox(height: 8),
                              _buildServiceBoxForSection(
                                'Shirodhara Therapy',
                                '4.95 (300K reviews)',
                                2500,
                                2800,
                                '1 hr 15 mins',
                                [
                                  'Therapy: Stress relief with oil drip',
                                  'Includes: Medicated oil, forehead drip',
                                ],
                                'SHIRODHARA',
                                'assets/images/ayurvedicSkinCare.jpg',
                              ),
                              const SizedBox(height: 8),
                              Divider(color: Colors.grey.shade300),
                              const SizedBox(height: 8),
                              _buildServiceBoxForSection(
                                'Stress Relief Massage',
                                '4.93 (280K reviews)',
                                1800,
                                2100,
                                '1 hr',
                                [
                                  'Massage: Stress reduction',
                                  'Includes: Herbal oils, scalp massage',
                                ],
                                'SHIRODHARA',
                                'assets/images/ayurvedicSkinCare.jpg',
                              ),
                              const SizedBox(height: 8),
                              Divider(color: Colors.grey.shade300),
                            ],
                          ),
                        ),
                        // Pain Relief Section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(color: Colors.grey.shade300),
                              const SizedBox(height: 8),
                              Text(
                                'Pain Relief',
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                key: _sectionKeys['Pain Relief'],
                              ),
                              const SizedBox(height: 16),
                              Divider(color: Colors.grey.shade300),
                              const SizedBox(height: 8),
                              _buildServiceBoxForSection(
                                'Back Pain Relief',
                                '4.91 (250K reviews)',
                                1500,
                                1800,
                                '1 hr',
                                [
                                  'Therapy: Back pain relief',
                                  'Includes: Hot oil massage, herbal compress',
                                ],
                                'PAIN RELIEF',
                                'assets/images/painRelief.jpg',
                              ),
                              const SizedBox(height: 8),
                              Divider(color: Colors.grey.shade300),
                              const SizedBox(height: 8),
                              _buildServiceBoxForSection(
                                'Joint Pain Relief',
                                '4.90 (220K reviews)',
                                1600,
                                1900,
                                '1 hr',
                                [
                                  'Therapy: Joint pain relief',
                                  'Includes: Medicated oil, heat therapy',
                                ],
                                'PAIN RELIEF',
                                'assets/images/painRelief.jpg',
                              ),
                              const SizedBox(height: 8),
                              Divider(color: Colors.grey.shade300),
                            ],
                          ),
                        ),
                        // Ayurvedic Skin Care Section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(color: Colors.grey.shade300),
                              const SizedBox(height: 8),
                              Text(
                                'Ayurvedic skin care',
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                key: _sectionKeys['Ayurvedic skin care'],
                              ),
                              const SizedBox(height: 16),
                              Divider(color: Colors.grey.shade300),
                              const SizedBox(height: 8),
                              _buildServiceBoxForSection(
                                'Ayurvedic Facial',
                                '4.90 (200K reviews)',
                                1200,
                                1500,
                                '1 hr',
                                [
                                  'Facial: Ayurvedic skin glow',
                                  'Includes: Herbal masks, gentle massage',
                                ],
                                'SKIN CARE',
                                'assets/images/painRelief.jpg',
                              ),
                              const SizedBox(height: 8),
                              Divider(color: Colors.grey.shade300),
                            ],
                          ),
                        ),
                        // Add-ons Section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(color: Colors.grey.shade300),
                              const SizedBox(height: 8),
                              Text(
                                'Add-ons',
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                key: _sectionKeys['Add-ons'],
                              ),
                              const SizedBox(height: 16),
                              Divider(color: Colors.grey.shade300),
                              const SizedBox(height: 8),
                              _buildServiceBoxForSection(
                                'Herbal Steam',
                                '4.89 (180K reviews)',
                                500,
                                600,
                                '30 mins',
                                [
                                  'Add-on: Herbal steam therapy',
                                  'Includes: Detox steam',
                                ],
                                'ADD-ONS',
                                'assets/images/painRelief.jpg',
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
                          SizedBox(
                            height: 120,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: services.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  child: GestureDetector(
                                    onTap: () => _scrollToSection(services[index]['label']!),
                                    child: _buildServiceBox(
                                      services[index]['label']!,
                                      services[index]['image']!,
                                      80,
                                    ),
                                  ),
                                );
                              },
                            ),
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
    return GestureDetector(
      onTap: () {
        // Future: Open half-page on tap
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image on top, full width
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Row for text content and Add button
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text content on the left
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                            '• $duration',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 1,
                      ),
                      const SizedBox(height: 8),
                      ...services.map((service) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('• ', style: TextStyle(fontSize: 14)),
                            Flexible(
                              child: Text(
                                service,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      )),
                      const SizedBox(height: 8),
                      const Text(
                        'View Details',
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                // Add button on the right
                Container(
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
              ],
            ),
          ],
        ),
      ),
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
        mainAxisAlignment: MainAxisAlignment.center,
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
          SizedBox(
            height: 20,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}