import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String url;
  VideoPlayerWidget(this.url);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  bool initialized = false;

  initState() {
    videoPlayerController = VideoPlayerController.network(widget.url);
    videoPlayerController.initialize().then((value) {
      chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          autoPlay: true,
          looping: false);
      initialized = true;
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: initialized
          ? Chewie(
              controller: chewieController,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
