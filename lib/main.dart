import 'package:flutter/material.dart';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

List<CameraDescription> cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

// recogniseText() async {
//   final textDetector = GoogleMlKit.vision.textDetector();
//   FirebaseVisionImage myImage = FirebaseVisionImage.fromFile(_userImageFile);
//   TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
//   VisionText readText = await recognizeText.processImage(myImage);
//   result = "";
//   for (TextBlock block in readText.blocks) {
//     for (TextLine line in block.lines) {
//       setState(() {
//         result = result + ' ' + line.text + '\n';
//       });
//     }
//   }
// }

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final textDetector = GoogleMlKit.vision.textDetector();
  late CameraController controller;
  String text = "test";

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // getTest() async {
  //   final RecognisedText recognisedText =
  //       await textDetector.processImage(inputImage);
  //   setState(() {
  //     text = recognisedText.text;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Google ML Kit Demo App'),
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
            child: Center(
                child: Column(
          children: [TextButton(onPressed: () {}, child: Text('Open'))],
        ))));
  }
}
