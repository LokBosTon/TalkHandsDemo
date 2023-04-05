import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ShowVideoScreen extends StatefulWidget {
  ShowVideoScreen(this.file, {super.key});
  File file;
  @override
  State<ShowVideoScreen> createState() => _ShowVideoScreenState();
}

class _ShowVideoScreenState extends State<ShowVideoScreen> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    initVideoPlayer();
  }

  void initVideoPlayer() async {
    _controller = VideoPlayerController.file(widget.file)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left, color: Colors.black),
        ),
        title: const Text(
          '',
          style: TextStyle(
              color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Center(
              child: _controller.value.isInitialized
                  ? Container(
                      height: 400,
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            IconButton(
              onPressed: () => _controller.play(),
              icon: Icon(Icons.play_arrow),
            ),
          ],
        ),
      ),
    );
  }
}
