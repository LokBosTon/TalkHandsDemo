import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';

import '../widgets/alphabettile.dart';

class Alphabet extends StatefulWidget {
  Alphabet({super.key});
  late Future<ListResult> futurefiles;

  @override
  State<Alphabet> createState() => _AlphabetState();
}

class _AlphabetState extends State<Alphabet> {
  @override
  void initState() {
    super.initState();
    downloadFolder();
  }

  Future<void> downloadFolder() async {
    final ListResult result =
        await FirebaseStorage.instance.ref('/Videos').listAll();
    final Directory tempDir = await getTemporaryDirectory();

    await Future.wait(result.items.map((Reference ref) async {
      final String fileName = ref.name;
      final File tempFile = File('${tempDir.path}/$fileName');
      await ref.writeToFile(tempFile);
    }));
  }

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
          'Alphabet',
          style: TextStyle(
              color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: List.generate(26, (index) => String.fromCharCode(index + 65))
            .map((e) =>
                AlphabetTile(e, SvgPicture.asset('assets/ASL_SVGs/$e.svg')))
            .toList(),
      ),
    );
  }
}
