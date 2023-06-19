// Error


import 'package:camera/camera.dart';
import 'package:flutter/material.dart';


class CameraPage extends StatefulWidget {
 CameraPage({super.key});
  @override
  State<CameraPage> createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  late CameraController cameraController;
  

  @override
  void initState() {
    super.initState();
    cameraController = CameraController(_cameras![0], ResolutionPreset.medium);
    cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    if (!cameraController.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: CameraPreview(cameraController),
    );
  }
}