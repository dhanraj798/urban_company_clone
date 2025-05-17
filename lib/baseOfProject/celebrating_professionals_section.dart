import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CelebratingProfessionalsSection extends StatefulWidget {
  final double screenWidth;

  const CelebratingProfessionalsSection({super.key, required this.screenWidth});

  @override
  State<CelebratingProfessionalsSection> createState() => _CelebratingProfessionalsSectionState();
}

class _CelebratingProfessionalsSectionState extends State<CelebratingProfessionalsSection> {
  // List of video paths
  final List<String> _videoPaths = [
    'assets/videos/vedio1.mp4',
    'assets/videos/professional2.mp4',
    'assets/videos/professional3.mp4',
    'assets/videos/professional4.mp4',
    'assets/videos/professional5.mp4',
  ];

  // Map to store controllers for visible items
  final Map<int, VideoPlayerController> _controllers = {};
  int? _currentlyPlayingIndex;

  @override
  void dispose() {
    // Dispose all controllers
    _controllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  // Initialize controller for a specific index
  void _initializeController(int index) {
    if (!_controllers.containsKey(index)) {
      final controller = VideoPlayerController.asset(_videoPaths[index])
        ..setLooping(true)
        ..setVolume(0.0); // Mute to avoid overlap
      _controllers[index] = controller;
      controller.initialize().then((_) {
        if (mounted) {
          setState(() {});
          // Play only if this is the currently visible item
          if (_currentlyPlayingIndex == index) {
            controller.play();
          }
        }
      });
    }
  }

  // Pause all videos except the one at the given index
  void _playVideo(int index) {
    _controllers.forEach((key, controller) {
      if (key != index && controller.value.isPlaying) {
        controller.pause();
      }
    });
    if (_controllers.containsKey(index)) {
      _controllers[index]!.play();
      _currentlyPlayingIndex = index;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(widget.screenWidth * 0.04, 0, widget.screenWidth * 0.04, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Celebrating professionals',
                    style: TextStyle(fontSize: widget.screenWidth * 0.05, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Real lives, real impact',
                    style: TextStyle(fontSize: widget.screenWidth * 0.035, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: widget.screenWidth * 0.04),
              itemCount: _videoPaths.length,
              itemBuilder: (context, index) {
                // Initialize controller for visible item
                _initializeController(index);

                final controller = _controllers[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 12), // Separator spacing
                  child: GestureDetector(
                    onTap: () {
                      // Toggle play/pause
                      setState(() {
                        if (controller != null && controller.value.isInitialized) {
                          if (controller.value.isPlaying) {
                            controller.pause();
                          } else {
                            _playVideo(index);
                          }
                        }
                      });
                    },
                    child: Container(
                      width: widget.screenWidth * 0.38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[300],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: controller != null && controller.value.isInitialized
                            ? Stack(
                          children: [
                            VideoPlayer(controller),
                            // Play/pause icon overlay
                            Center(
                              child: controller.value.isPlaying
                                  ? const SizedBox.shrink()
                                  : Icon(
                                Icons.play_arrow,
                                color: Colors.white.withOpacity(0.7),
                                size: 48,
                              ),
                            ),
                          ],
                        )
                            : Container(
                          color: Colors.grey[200],
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 40),
          Container(height: 8, color: Colors.grey[300]),
        ],
      ),
    );
  }
}