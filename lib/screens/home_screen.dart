import 'package:flutter/material.dart';
import '../baseOfProject/header_section.dart';
import '../baseOfProject/service_box_section.dart';
import '../baseOfProject/banner_section.dart';
import '../baseOfProject/thoughtful_curations_section.dart';
import '../baseOfProject/new_and_noteworthy_section.dart';
import '../baseOfProject/most_booked_services_section.dart';
import '../baseOfProject/large_banner_section.dart';
import '../baseOfProject/celebrating_professionals_section.dart';
import '../baseOfProject/category_section.dart';
import '../widgets/SearchBarDelegate.dart';
import '../widgets/SlidingPanel.dart';
import '../widgets/women_Spa_Half_Page.dart';
import '../widgets/men_Spa_Half_Page.dart';
import '../widgets/Ac_repair_Half_Page.dart';
import '../widgets/cleaning_Half_Page.dart';
import '../widgets/Electrician_Half_Page.dart';
import '../widgets/nativeWaterPurifier.dart';
import '../widgets/nativeSmartLocks.dart';
import '../widgets/painting&WaterProofing.dart';
import '../widgets/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();
  late final PageController _pageController;
  double _currentPage = 0.0;
  bool _isPanelVisible = false;
  String _selectedBoxTitle = '';
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  bool _isHalfPageOpen = false; // Tracks if half-page is open
  double _sheetPosition = 0.9; // Track the sheet's position (starts at 90%)

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.92);
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0.0;
      });
    });
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _searchFocusNode.dispose();
    _searchController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _togglePanel([String title = '']) {
    setState(() {
      _isPanelVisible = !_isPanelVisible;
      _selectedBoxTitle = _isPanelVisible ? title : '';
    });
  }

  void _openServiceDetail(String serviceTitle) {
    Widget halfPage;
    bool isDraggable = true; // Default to draggable
    double initialHeight = 0.9; // Default to 90%

    // Configure half-page properties or redirect to full page based on service title
    switch (serviceTitle) {
      case "Women's Salon & Spa":
        halfPage = const women_Spa_Half_Page(
          title: "Women's Salon & Spa",
          isDraggable: false,
          initialHeight: 0.3,
        );
        isDraggable = false;
        initialHeight = 0.3;
        break;
      case "Men's Salon & Massage":
        halfPage = const men_Spa_Half_Page(
          title: "Men's Salon & Massage",
          isDraggable: false,
          initialHeight: 0.3,
        );
        isDraggable = false;
        initialHeight = 0.3;
        break;
      case "AC & Appliance Repair":
        halfPage = const Ac_repair_Half_Page(
          title: "AC & Appliance Repair",
          isDraggable: true,
          initialHeight: 0.9,
        );
        isDraggable = true;
        initialHeight = 0.9;
        break;
      case "Cleaning & Pest Control":
        halfPage = const cleaning_Half_Page(
          title: "Cleaning & Pest Control",
          isDraggable: true,
          initialHeight: 0.9,
        );
        isDraggable = true;
        initialHeight = 0.9;
        break;
      case "Electrician, Plumber & Carpenter":
        halfPage = const Electrician_Half_Page(
          title: "Electrician, Plumber & Carpenter",
          isDraggable: true,
          initialHeight: 0.9,
        );
        isDraggable = true;
        initialHeight = 0.9;
        break;
      case "Native Water Purifier":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  NativeWaterPurifier()),
        );
        return; // Exit the method after redirecting to full page
      case "Native Smart Locks":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NativeSmartLocks()),
        );
        return; // Exit the method after redirecting to full page
      case "Painting & Waterproofing":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PaintingAndWaterproofing()),
        );
        return; // Exit the method after redirecting to full page
      default:
        halfPage = const women_Spa_Half_Page(
          title: "Default",
          isDraggable: false,
          initialHeight: 0.3,
        );
        isDraggable = false;
        initialHeight = 0.3;
    }

    setState(() {
      _isHalfPageOpen = true; // Show overlay when half-page opens
      _sheetPosition = initialHeight; // Set initial position
    });
    _animationController.forward(); // Start fade-in animation for overlay

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      useSafeArea: false, // Prevent clipping by safe area
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Stack(
              clipBehavior: Clip.none, // Ensure no clipping
              children: [
                NotificationListener<DraggableScrollableNotification>(
                  onNotification: (notification) {
                    if (isDraggable) {
                      setState(() {
                        _sheetPosition = notification.extent; // Update position only for draggable sheets
                      });
                      setModalState(() {}); // Force rebuild
                    }
                    // Force rebuild for non-draggable to ensure initial render
                    setModalState(() {});
                    return true;
                  },
                  child: halfPage,
                ),

              ],
            );
          },
        );
      },
    ).whenComplete(() {
      _animationController.reverse();
      setState(() {
        _isHalfPageOpen = false; // Ensure overlay is hidden after dismissal
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              HeaderSection(screenWidth: screenWidth),
              SliverPersistentHeader(
                pinned: true,
                delegate: SearchBarDelegate(
                  focusNode: _searchFocusNode,
                  controller: _searchController,
                ),
              ),
              ServiceBoxSection(screenWidth: screenWidth, onTap: _openServiceDetail),
              BannerSection(screenWidth: screenWidth, pageController: _pageController, currentPage: _currentPage),
              ThoughtfulCurationsSection(screenWidth: screenWidth),
              NewAndNoteworthySection(screenWidth: screenWidth),
              MostBookedServicesSection(screenWidth: screenWidth),
              LargeBannerSection(screenWidth: screenWidth),
              CelebratingProfessionalsSection(screenWidth: screenWidth),
              CategorySection(screenWidth: screenWidth, title: "Saloon for women", items: saloonGridItems),
              CategorySection(screenWidth: screenWidth, title: "Spa for women", items: spaGridItems),
              LargeBannerSection(screenWidth: screenWidth),
              CategorySection(screenWidth: screenWidth, title: "Cleaning and pest control", items: cleaningPestGridItems),
              LargeBannerSection(screenWidth: screenWidth),
              CategorySection(screenWidth: screenWidth, title: "AC & Appliance Repair", items: cleaningPestGridItems),
              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          ),

          if (_isHalfPageOpen)
            AnimatedBuilder(
              animation: _opacityAnimation,
              builder: (context, child) {
                return Container(
                  color: Colors.black.withValues(alpha: _opacityAnimation.value), // Fixed deprecation warning
                );
              },
            ),
          SlidingPanel(
            isVisible: _isPanelVisible,
            title: _selectedBoxTitle,
            onToggle: _togglePanel,
          ),
        ],
      ),
    );
  }
}