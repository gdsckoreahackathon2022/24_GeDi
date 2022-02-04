import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gedi/screens/text_recognition_screen.dart';
import 'package:gedi/utils/show_dialog.dart';
import 'package:gedi/widgets/icon_round_button.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceTypeScreen extends StatelessWidget {
  const ImageSourceTypeScreen({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ImageSourceTypeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ImagePicker imagePicker = ImagePicker();

    return Scaffold(
      appBar: AppBar(
        title: const Text('GEDI'),
        backgroundColor: const Color(0xffa3a4cd),
        elevation: 0,
      ),
      backgroundColor: const Color(0xff6667AB),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: const Text(
                "주변에 존재하는 잘못된 단어를 찾아보고\n올바른 단어가 무엇인지 알아봐요!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ImageSourceSelector(
                  onPressed: () async {
                    try {
                      var image = await imagePicker.pickImage(
                        source: ImageSource.gallery,
                      );
                      TextRecognitionScreen.show(context,
                          image: File(image!.path));
                    } on Exception {
                      ShowDialog(
                        title: const Text("경고"),
                        content: const Text("이미지 불러오기 실패"),
                        actions: [
                          TextButton(
                            child: const Text("OK"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ).showAlertDialog(context);
                    }
                  },
                  icon: Icons.image_search_outlined,
                  title: "이미지로 찾기",
                  description: "갤러리에서 단어가 촬영된 이미지를 불러오세요",
                ),
                ImageSourceSelector(
                  onPressed: () async {
                    try {
                      var image = await imagePicker.pickImage(
                        source: ImageSource.camera,
                        imageQuality: 100,
                        preferredCameraDevice: CameraDevice.rear,
                      );
                      TextRecognitionScreen.show(context,
                          image: File(image!.path));
                    } on Exception {
                      ShowDialog(
                        title: const Text("경고"),
                        content: const Text("촬영 실패"),
                        actions: [
                          TextButton(
                            child: const Text("OK"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ).showAlertDialog(context);
                    }
                  },
                  icon: Icons.camera_alt_outlined,
                  title: "촬영으로 찾기",
                  description: "주변의 단어를 직접 촬영하여 단어가 잘못 되었는지 확인해보세요",
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }
}

class ImageSourceSelector extends StatelessWidget {
  const ImageSourceSelector({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String description;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        children: <Widget>[
          IconRoundButton(
            width: 150,
            height: 150,
            icon: icon,
            backgroundColor: const Color(0xffa3a4cd),
            onPressed: onPressed,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 150 * 0.9,
            child: Text(
              description,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
