### 24_다다른

# GeDi

![Flutter](https://img.shields.io/badge/Dart-Flutter-blue?logo=Flutter)
![Firebase](https://img.shields.io/badge/with-Firebase-FFCC00?logo=Firebase)

GeDi(제디) - Gender-Neutral Dictionary.

## 개요

GeDi(Gender-Neutral Dictionary)는 일상 속에서 관습처럼 굳어진 채 사용되는 성차별 단어를 성평등 단어로 바꾸기 위해 기획된 성평등 단어사전입니다.
간단한 문제풀이를 통해 스스로의 성평등 의식을 점검해보고, 사용자가 보다 높은 성평등 의식 수준을 지향할 수 있도록 경험을 제공합니다.
또한 직접 구축한 성평등 단어사전을 통하여 잘 알지 못했던 성차별 단어들을 알고 스스로 언어습관을 바꾸어갈 수 있으며 나아가 AI 기술을 활용한 단어 인식을 통해 일상생활 속에서의 성차별 단어들을 성평등 단어사전에 구축한 단어로 바꾸어볼 수 있습니다.

## 사용 기술

- Flutter
- Firebase (Firestore, Authentication)
- Google ML Kit ver. 2

## 기능 소개

### GeDi의 기능은 크게 5가지로 나뉩니다.

1. 성평등 문제풀이

    매일 한 개의 성차별 단어를 정정하는 문제를 제공하며, 원하는 사용자들은 3개의 문제를 추가적으로 풀 수 있습니다. 

    풀이한 단어의 수에 따라 사용자 개인의 포인트가 쌓이고, 레벨이 오르도록 설계되어 있습니다.

2. Weekly Knowledge

    해당 주에 새로 업데이트된 성평등 단어와 배경에 대한 내용을 메인 페이지에서 제공합니다.

3. 성평등 단어사전

    성차별 단어들을 성평등 단어로 수정한 사전을 제공합니다. 검색이 가능하며 FireBase에서 데이터를 불러오며, 지속적으로 업데이트 됩니다.

4. 성평등 영상 추천

    성평등 인식을 개선하는 영상을 추천합니다.

5. 이미지 인식 및 차별 단어 수정

    이미지 혹은 카메라 촬영 사진에서 단어를 읽어내 단어사전의 내용과 대조하여 성차별 단어인지 판단하고, 성차별 단어라면 성평등 단어로 바꿔쓸 수 있는 사전의 데이터를 보여줍니다.

# Getting Started

## Installation

1. [How to install Flutter](https://flutter.dev/docs/get-started/install)

2. [Set up an editor](https://flutter.dev/docs/get-started/editor?tab=vscode)

3. App Clone:

```bash
git clone https://github.com/gdsckoreahackathon2022/24_GeDi.git
```

## Build and Run

1. [Providing SHA1/SHA256 key](https://developers.google.com/android/guides/client-auth)

2. After creating SHA-1 / 256 key using JAVA keytool, add it to "SHA certificate fingerprint" in "My App" of firebase.

3. Launch `Terminal` and move to Project Directory.

4. Enter `flutter pub get`.

```bash
cd gedi
flutter pub get
```

5. Enter `flutter run`.

```bash
flutter run
```

# 스크린샷
<img src="https://user-images.githubusercontent.com/56063805/152618501-7f410556-eaa2-44d0-8cdc-f758496cf163.png" width="30%"><img src="https://user-images.githubusercontent.com/56063805/152618515-31565c4c-2716-4429-bd5a-758f032d1c1c.png" width="30%"><img src="https://user-images.githubusercontent.com/56063805/152618529-ae14900f-794b-4bf8-b152-6b92fe1a364c.png" width="30%">
<img src="https://user-images.githubusercontent.com/56063805/152618524-b2b64ef6-0f84-4372-8c1c-b995abb0bcb4.png" width="30%"><img src="https://user-images.githubusercontent.com/56063805/152618534-170f29e3-d679-42f2-80ea-e25aa1b8db3e.png" width="30%"><img src="https://user-images.githubusercontent.com/56063805/152618548-5d90b176-d683-405d-908b-d531b33fd33a.png" width="30%">
<img src="https://user-images.githubusercontent.com/56063805/152618542-54c34d5a-1dcb-4c2e-bc38-dee00b0ccf9f.png" width="30%"><img src="https://user-images.githubusercontent.com/56063805/152618550-2f155180-4d2c-47cd-8789-814f2159680a.png" width="30%"><img src="https://user-images.githubusercontent.com/56063805/152618556-a0358ef5-1a19-4cf6-9061-432f4335dbac.png" width="30%">
<img src="https://user-images.githubusercontent.com/56063805/152618559-d417af53-8320-4a46-bd7d-4a8d7a738f6f.png" width="30%"><img src="https://user-images.githubusercontent.com/56063805/152618561-696ceb42-8cf4-428f-96e6-208b431ec879.png" width="30%"><img src="https://user-images.githubusercontent.com/56063805/152618566-0ac5da61-f71d-4788-abf6-8460980632c1.png" width="30%">
<img src="https://user-images.githubusercontent.com/56063805/152618569-53393481-cd32-41bf-bd43-5ec34bcb57d4.png" width="30%"><img src="https://user-images.githubusercontent.com/56063805/152618571-b208cf4b-ba62-404e-990c-7359122fdf21.png" width="30%"><img src="https://user-images.githubusercontent.com/56063805/152618579-27efa176-dde7-4888-8fc3-e007203df4dc.png" width="30%">


# Contributors

- [Yeeun Kim](https://github.com/Yeeunbb)
- [Dain Kang](https://github.com/melli0505)
- [Hyeongcheol Shin](https://github.com/ShinHyeongcheol)
- [Wonhyuk Choi](https://github.com/devluce)

# License

[MIT](https://choosealicense.com/licenses/mit/)
