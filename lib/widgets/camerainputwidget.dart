import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraInputWidget extends StatefulWidget {
  const CameraInputWidget({super.key});

  @override
  State<CameraInputWidget> createState() => _CameraInputWidgetState();
}

class _CameraInputWidgetState extends State<CameraInputWidget> {
  List<CameraDescription> cameras = [];
  late CameraController _cameraController;

  @override
  void initState() {
    super.initState();
    getCamera().then((value) {
      cameras = value;
      initCamera(cameras[0]);
    });
  }

  Future<List<CameraDescription>> getCamera() async {
    final cameras = await availableCameras();
    return cameras;
  }

  Future initCamera(CameraDescription cameraDescription) async {
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _cameraController.value.isInitialized
        ? Padding(
            padding: const EdgeInsets.all(50.0),
            child: AspectRatio(
              aspectRatio: 1,
              child: CameraPreview(_cameraController),
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
