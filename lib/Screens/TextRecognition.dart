import 'dart:io';

import 'package:firebase_ml_vision_raw_bytes/firebase_ml_vision_raw_bytes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Textrecognition extends StatefulWidget {
  final String text;
  const Textrecognition({Key? key, required this.text}) : super(key: key);

  @override
  State<Textrecognition> createState() => _TextrecognitionState();
}

class _TextrecognitionState extends State<Textrecognition> {
  late File image;
  bool isimageloaded = false;
  getImageFromGallery() async {
    var temp = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(temp!.path);
      isimageloaded = true;
    });
  }

  String result = '';
  readTextFromImage() async {
    FirebaseVisionImage imagetaken_analnysis =
        FirebaseVisionImage.fromFile(image);
    TextRecognizer recognized_As_Text =
        FirebaseVision.instance.textRecognizer();
    VisionText final_recognied_words =
        await recognized_As_Text.processImage(imagetaken_analnysis);

    for (TextBlock block in final_recognied_words.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement element in line.elements) {
          setState(() {
            result = result + "  ${element.text}";
            print(result);
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.text),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            (isimageloaded)
                ? Center(
                    child: Container(
                      height: 280,
                      width: 280,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: FileImage(image), fit: BoxFit.cover)),
                    ),
                  )
                : Center(
                    child: Container(
                      height: 280,
                      width: 280,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green),
                    ),
                  ),
            SizedBox(
              height: 100,
            ),
            Row(children: [
              ElevatedButton(
                  onPressed: getImageFromGallery,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Open Gallery"),
                      Icon(Icons.add_a_photo)
                    ],
                  )),
              ElevatedButton(onPressed: readTextFromImage, child: const Text("Read Text"))
            ]),
            SizedBox(height: 30,),
            Text((result==null)?'k':result)
          ],
        ));
  }
}
