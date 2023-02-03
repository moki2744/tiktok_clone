import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4;
  final PageController _pageController = PageController();
  final Duration _scrollDuration = const Duration(milliseconds: 250);
  final Curve _scrollCurve = Curves.linear;

  void _onPageChanged(value) {
    _pageController.animateToPage(value,
        duration: _scrollDuration, curve: _scrollCurve);
    setState(() {
      if (value == _itemCount - 1) {
        _itemCount += 4;
      }
    });
  }

  void _onVideoFinished() {
    return;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        onPageChanged: (value) => _onPageChanged(value),
        itemCount: _itemCount,
        itemBuilder: (BuildContext context, int index) => VideoPost(
              onVideoFinished: _onVideoFinished,
              index: index,
            ));
  }
}
