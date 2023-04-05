import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signier_demo/widgets/showwordwidget.dart';

class AlphabetTile extends StatefulWidget {
  AlphabetTile(this.text, this.image, {super.key});
  String text;
  SvgPicture image;
  late Future<ListResult> futurefiles;

  @override
  State<AlphabetTile> createState() => _AlphabetTileState();
}

class _AlphabetTileState extends State<AlphabetTile> {
  void onPressed(BuildContext context) async {
    Reference ref = FirebaseStorage.instance.ref('/Videos').child('A.mp4');
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => onPressed(context),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: widget.image,
                ),
                Positioned(
                    child: Text(widget.text,
                        style: const TextStyle(fontWeight: FontWeight.bold)))
              ],
            )),
      ),
    );
  }
}
