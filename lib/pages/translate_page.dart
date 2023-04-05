import 'package:flutter/material.dart';
import 'package:signier_demo/widgets/camerainputwidget.dart';
import 'package:signier_demo/widgets/textinputwidget.dart';
import 'package:camera/camera.dart';

class TranslatePage extends StatefulWidget {
  const TranslatePage({super.key});

  @override
  State<TranslatePage> createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  List<CameraDescription> cameras = [];
  VoidCallbackAction? _onpressed() {
    setState(() {
      String temp = string1;
      string1 = string2;
      string2 = temp;
    });
    return null;
  }

  Future<List<CameraDescription>> getCamera() async {
    final cameras = await availableCameras();
    return cameras;
  }

  @override
  void initState() {
    super.initState();
    getCamera().then((value) {
      cameras = value;
    });
  }

  Widget _buildInputWidget(index) {
    return _pages[index]!;
  }

  final Map<String, Widget> _pages = <String, Widget>{
    'English': const TextInputWidget(),
    'Sign': const CameraInputWidget(),
  };

  String string1 = 'English';
  String string2 = 'Sign';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width, height: 70),
          const Text(
            'Signier',
            style: TextStyle(
              fontSize: 36,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  string1,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                    onPressed: _onpressed, icon: const Icon(Icons.swap_horiz)),
                Text(
                  string2,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          _buildInputWidget(string1),
        ],
      ),
    );
  }
}
