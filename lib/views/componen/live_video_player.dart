import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class LiveVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const LiveVideoPlayer({super.key, required this.videoUrl});

  @override
  State<LiveVideoPlayer> createState() => _LiveVideoPlayerState();
}

class _LiveVideoPlayerState extends State<LiveVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _isLandscape = false;
  double _playbackSpeed = 2.0; // default playback speed

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _controller.setLooping(false); /* true */
          _controller.play();
          _isPlaying = true;
        });
      });
    // Set default playback speed to 2.0x
    _controller.setPlaybackSpeed(_playbackSpeed);
  }
  
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _setPlaybackSpeed(double speed) {
    setState(() {
      _playbackSpeed = speed;
      _controller.setPlaybackSpeed(speed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _isPlaying
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(_controller),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Row(
                    children: [
                      PopupMenuButton<double>(
                        onSelected: _setPlaybackSpeed,
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 1.0,
                            child: Text('1x'),
                          ),
                          const PopupMenuItem(
                            value: 1.25,
                            child: Text('1.25x'),
                          ),
                          const PopupMenuItem(
                            value: 1.5,
                            child: Text('1.5x'),
                          ),
                          const PopupMenuItem(
                            value: 1.75,
                            child: Text('1.75x'),
                          ),
                          const PopupMenuItem(
                            value: 2.0,
                            child: Text('2x'),
                          ),
                          const PopupMenuItem(
                            value: 2.5,
                            child: Text('2.5x'),
                          ),
                        ],
                        child: const Icon(
                          Icons.speed,
                          color: Colors.white,
                          size: 32
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          _isLandscape ? Icons.fullscreen_exit : Icons.fullscreen,
                          color: Colors.white,
                          size: 32,
                        ),
                        onPressed: () {
                          setState(() {
                            _isLandscape = !_isLandscape;
                            if (_isLandscape) {
                              SystemChrome.setPreferredOrientations([
                                DeviceOrientation.landscapeLeft,
                                DeviceOrientation.landscapeRight,
                              ]);
                            } else {
                              SystemChrome.setPreferredOrientations([
                                DeviceOrientation.portraitUp,
                                DeviceOrientation.portraitDown,
                              ]);
                            }
                          });
                        },
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          )
        : const AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(child: CircularProgressIndicator())
        ),
    );
  }
}
