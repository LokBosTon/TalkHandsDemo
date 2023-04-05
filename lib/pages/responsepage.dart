import 'dart:io';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';

class ResponsePage extends StatefulWidget {
  const ResponsePage({super.key});

  @override
  State<ResponsePage> createState() => _ResponsePageState();
}

class _ResponsePageState extends State<ResponsePage> {
  late Directory _appDocDir;
  late Directory folder;
  late Future<ListResult> files;
  List<String> images = [];

  Future<void> getImagesInDirectory(String directoryPath) async {
    List<String> imageFiles = [];
    Directory directory = Directory(directoryPath);
    if (await directory.exists()) {
      List<FileSystemEntity> files = directory.listSync();
      for (FileSystemEntity file in files) {
        if (file is File) {
          String filePath = file.path;
          if (filePath.toLowerCase().endsWith('.jpg') ||
              filePath.toLowerCase().endsWith('.jpeg') ||
              filePath.toLowerCase().endsWith('.png')) {
            imageFiles.add(filePath);
          }
        }
      }
    }
    setState(() {
      images = imageFiles;
    });
    print(images);
  }

  Future<void> generateVideo() async {
    final String videoPath = '${_appDocDir.path}/video.mp4';
    final String command = '';

    FFmpegKit.execute(command).then((session) async {
      final returnCode = await session.getReturnCode();
      print(returnCode);
      print(ReturnCode.isSuccess(returnCode));
    });
  }

  //check if the folder exists
  Future<void> _checkFolder() async {
    _appDocDir = await getApplicationDocumentsDirectory();
    final Directory _appDocDirFolder = Directory('${_appDocDir.path}/images');
    setState(() {
      folder = _appDocDirFolder;
    });
    final bool _hasExisted = await _appDocDirFolder.exists();
    if (_hasExisted) {
      print('Folder already exists');
    } else {
      _appDocDirFolder.create();
      print('Folder created');
      install();
    }
  }

  //install images from firebase storage to the folder
  Future<void> install() async {
    final list = await FirebaseStorage.instance.ref('/Images').listAll();
    Directory directory = await getApplicationDocumentsDirectory();
    for (var item in list.items) {
      if (item is Reference) {
        File localFile = File('${directory.path}/images/${item.name}');
        await item.writeToFile(localFile);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        _checkFolder().then((value) => getImagesInDirectory(folder.path)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: IconButton(
        onPressed: () => generateVideo(),
        icon: const Icon(Icons.add),
      ),
    ));
  }
}
