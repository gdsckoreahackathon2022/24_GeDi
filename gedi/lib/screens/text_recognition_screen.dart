import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gedi/models/dictionary.dart';
import 'package:gedi/screens/image_view_screen.dart';
import 'package:gedi/utils/database.dart';
import 'package:gedi/widgets/image_round_container.dart';
import 'package:google_ml_kit_for_korean/google_ml_kit_for_korean.dart';

class TextRecognitionScreen extends StatefulWidget {
  const TextRecognitionScreen({Key? key, required this.image})
      : super(key: key);
  final File image;

  static Future<void> show(BuildContext context, {required File image}) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => TextRecognitionScreen(
          image: image,
        ),
      ),
    );
  }

  @override
  State<TextRecognitionScreen> createState() => _TextRecognitionScreenState();
}

class _TextRecognitionScreenState extends State<TextRecognitionScreen> {
  late InputImage visionImage;
  TextDetectorV2 textDetector = GoogleMlKit.vision.textDetectorV2();
  late RecognisedText visionText;
  late Stream<List<Dictionary>> streamData;

  @override
  void initState() {
    final database = FirestoreDatabase();
    streamData = database.dictionaryStream();
    super.initState();
    visionImage = InputImage.fromFile(widget.image);
  }

  Future<String> recognized() async {
    // visionText = await textRecognizer.processImage(visionImage);
    visionText = await textDetector.processImage(visionImage);
    String text = visionText.text;
    print("vision Text : ${text}");

    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GEDI'),
        backgroundColor: const Color(0xffa3a4cd),
        elevation: 0,
      ),
      backgroundColor: const Color(0xff6667AB),
      body: Center(
        child: Column(
          children: <Widget>[
            Hero(
              tag: 'image',
              child: ImageRoundContainer(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.5,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                image: FileImage(widget.image),
                onPressed: () => ImageViewScreen.show(
                  context,
                  image: FileImage(widget.image),
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffa3a4cd),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  FutureBuilder(
                    future: recognized(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData == false) {
                        return const RecognizedWordsContainer(
                            content: "No Data");
                      } else if (snapshot.hasError) {
                        return RecognizedWordsContainer(
                            content: 'Error: ${snapshot.error}');
                      } else {
                        String content = snapshot.data.toString();
                        if (content == "") {
                          return const RecognizedWordsContainer(
                              content: "발견한 단어가 없습니다.");
                        } else {
                          return RecognizedWordsContainer(
                            content: content,
                            streamData: streamData,
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RecognizedWordsContainer extends StatelessWidget {
  const RecognizedWordsContainer({
    Key? key,
    required this.content,
    this.streamData,
  }) : super(key: key);

  final String content;
  final Stream<List<Dictionary>>? streamData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        LetterInImageContainer(
          title: "사진 속에서 찾아낸 글자",
          content: content,
        ),
        Expanded(
          child: StreamBuilder<List<Dictionary>>(
              stream: streamData,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CorrectWordsContainer(
                    title: "잘못된 단어 수정",
                    wrongWords: [],
                    correctWords: [],
                  );
                }
                List<String> wrongWords = [];
                List<String> correctWords = [];
                snapshot.data!.asMap().forEach((index, word) {
                  if (content.contains(word.wrongWord)) {
                    wrongWords.add(word.wrongWord);
                    correctWords.add(word.title);
                  }
                });
                return CorrectWordsContainer(
                  title: "잘못된 단어 수정",
                  wrongWords: wrongWords,
                  correctWords: correctWords,
                );
              }),
        )
      ],
    );
  }
}

class LetterInImageContainer extends StatelessWidget {
  const LetterInImageContainer({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 6,
      margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 5.0,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 5, top: 5),
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xff6667AB),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(content),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CorrectWordsContainer extends StatelessWidget {
  const CorrectWordsContainer({
    Key? key,
    required this.title,
    required this.wrongWords,
    required this.correctWords,
  }) : super(key: key);

  final String title;
  final List<String> wrongWords;
  final List<String> correctWords;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 5.0,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 5, top: 5),
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xff6667AB),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
              child: Center(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: wrongWords.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: Text(wrongWords[index]),
                      ),
                    ),
                    const Expanded(
                      flex: 2,
                      child: Image(
                        height: 50,
                        image: AssetImage('assets/icons/arrow.png'),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: Text(correctWords[index]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
