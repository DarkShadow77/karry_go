import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class RecognizePage extends StatefulWidget {
  const RecognizePage({Key? key, this.path}) : super(key: key);

  final String? path;

  @override
  State<RecognizePage> createState() => _RecognizePageState();
}

class _RecognizePageState extends State<RecognizePage> {
  bool _isBusy = false;
  String scannedText = "";

  TextEditingController textController = TextEditingController();
  TextEditingController text2Controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final InputImage inputImage = InputImage.fromFilePath(widget.path!);

    processImage(inputImage);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Recognize Page"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              maxLines: 25,
              controller: textController,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              maxLines: 10,
              controller: text2Controller,
            ),
          ),
        ],
      ),
    );
  }

  void processImage(InputImage image) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    setState(() {
      _isBusy = true;
    });

    log(image.filePath!);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(image);

    await textRecognizer.close();
    if (recognizedText.text.toUpperCase().contains("NATIONAL DRIVERS")) {
      log("This is a driver's license");
    } else {
      log("Please provide a driver's license");
    }

    text2Controller.text = recognizedText.blocks[0].text +
        "\n\n" +
        recognizedText.blocks[1].text +
        "\n\n" +
        recognizedText.blocks[2].text +
        "\n\n" +
        recognizedText.blocks[3].text +
        "\n\n";

    for (TextBlock block in recognizedText.blocks) {
      /*final Rect rect = block.rect;
      final List<Offset> cornerPoints = block.cornerPoints.cast<Offset>();
      final String text = block.text;
      final List<String> languages = block.recognizedLanguages;*/

      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        textController.text = textController.text + line.text + "\n";

        for (TextElement element in line.elements) {
          // Same getters as TextBlock
        }
      }
    }

    setState(() {
      _isBusy = false;
    });
  }
}
