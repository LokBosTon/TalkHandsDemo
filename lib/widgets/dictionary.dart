import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signier_demo/widgets/showwordwidget.dart';

class Dictionary extends StatelessWidget {
  Dictionary({super.key});

  List<String> words = [
    'Fine',
    'Go',
    'More',
    'Wrong',
    'Hello',
    'Yes',
    'No',
    'Mother',
    'Brother',
    'Sister',
    'Grandmother',
    'Grandfather',
    'Home',
    'Work'
  ];

  @override
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
          'Dictionary',
          style: TextStyle(
              color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: words.length,
        itemBuilder: (BuildContext context, int index) {
          return DictionaryTile(index: index);
        },
      ),
    );
  }
}

class DictionaryTile extends StatelessWidget {
  DictionaryTile({
    super.key,
    required this.index,
  });

  final int index;

  List<String> words = [
    'Fine',
    'Go',
    'More',
    'Wrong',
    'Hello',
    'Yes',
    'No',
    'Mother',
    'Brother',
    'Sister',
    'Grandmother',
    'Grandfather',
    'Home',
    'Work'
  ];

  void onPressed(BuildContext context) async {
    Reference ref = FirebaseStorage.instance.ref('/Words').child('Fine.mp4');
    final Directory tempDir = await getTemporaryDirectory();
    final File tempFile = File('${tempDir.path}/myvideo.mp4');
    await ref.writeToFile(tempFile);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShowVideoScreen(tempFile),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 30,
        child: ElevatedButton(
          child: Text('${words[index]}',
              style: TextStyle(fontSize: 20, color: Colors.black)),
          onPressed: () => onPressed(context),
          style: ButtonStyle(
            alignment: Alignment.centerLeft,
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
            elevation: MaterialStateProperty.all<double>(0),
          ),
        ),
      ),
    );
  }
}
