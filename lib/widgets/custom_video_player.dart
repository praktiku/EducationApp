import 'package:ulearn/constants/color.dart';
import 'package:ulearn/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoSource;

  const CustomVideoPlayer({Key? key, required this.videoSource})
      : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller;
  static const double aspectRatio = 16.0 / 9.0;
  Widget? controls;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  @override
  void didUpdateWidget(CustomVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoSource != widget.videoSource) {
      _initializeVideoPlayer();
    }
  }

  void _initializeVideoPlayer() {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoSource),
    )
      ..initialize().then((_) {
        setState(() {});
      })
      ..addListener(() {
        setState(() {
          if (_controller.value.position >= _controller.value.duration) {
            _controller.seekTo(Duration.zero);
          }

          if (_controller.value.isPlaying) {
            controls = GestureDetector(
              onTap: () {
                setState(() {
                  _controller.pause();
                });
              },
            );
          } else {
            controls = GestureDetector(
              onTap: () {
                setState(() {
                  _controller.play();
                });
              },
              child: Image.asset(
                icLearning,
                height: 50,
              ),
            );
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Stack(
        children: [
          VideoPlayer(_controller),
          Positioned.fill(
            child: Center(
              child: _controller.value.isInitialized
                  ? (controls ?? Container())
                  : const CircularProgressIndicator(),
            ),
          ),
          if (_controller.value.isInitialized)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          _formatDuration(_controller.value.position),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                        ),
                        const Text(
                          " / ",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        Text(
                          _formatDuration(_controller.value.duration),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  VideoProgressIndicator(
                    _controller,
                    allowScrubbing: true,
                    colors: const VideoProgressColors(
                      playedColor: kPrimaryColor,
                      backgroundColor: Colors.grey,
                      bufferedColor: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${minutes > 59 ? '$hours:' : ''}${minutes < 10 ? '0$minutes' : minutes}:${seconds < 10 ? '0$seconds' : seconds}';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
