import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ShowQuestionScreen extends StatefulWidget {
  ShowQuestionScreen(this.file, this.letter, {super.key});
  File file;
  String letter;
  @override
  State<ShowQuestionScreen> createState() => _ShowQuestionScreenState();
}

class _ShowQuestionScreenState extends State<ShowQuestionScreen> {
  late VideoPlayerController _controller;
  String option1 = 'A';
  String option2 = 'B';
  String option3 = 'C';
  String option4 = 'D';
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

  void onPressed() {
    print('Pressed');
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
          'Alphabet',
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
                      height: 250,
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
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 53,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(option1,
                      style: TextStyle(
                          color: Color(0xFF00A9B7),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 53,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(option2,
                      style: TextStyle(
                          color: Color(0xFF00A9B7),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 53,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(option3,
                      style: TextStyle(
                          color: Color(0xFF00A9B7),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 53,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(option4,
                      style: TextStyle(
                          color: Color(0xFF00A9B7),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
