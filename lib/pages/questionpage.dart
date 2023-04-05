import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signier_demo/widgets/showquestionwidget.dart';
import 'package:video_player/video_player.dart';

class QuestionPage extends StatefulWidget {
  QuestionPage(this.title, {super.key});
  String title;
  late File file;
  late String letter;
  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late VideoPlayerController _controller;
  void getRandomLetter() {
    final random = Random();
    final letterCode = random.nextInt(26) + 65; // ASCII code for A-Z
    final letter = String.fromCharCode(letterCode);
    setState(() {
      widget.letter = 'A';
    });
    print(widget.letter);
  }

  void get(BuildContext context) async {
    Reference ref =
        FirebaseStorage.instance.ref('/Videos').child('${widget.letter}.mp4');
    final Directory tempDir = await getTemporaryDirectory();
    final File tempFile = File('${tempDir.path}/myvideo.mp4');
    await ref.writeToFile(tempFile);
    setState(() {
      widget.file = tempFile;
    });
  }

  @override
  initState() {
    getRandomLetter();
    get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.file == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ShowQuestionScreen(widget.file, widget.letter);
  }
}
