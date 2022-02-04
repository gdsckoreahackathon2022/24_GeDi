import 'package:flutter/material.dart';
import 'package:gedi/screens/image_source_type_screen.dart';
import 'package:gedi/widgets/dictionary_container.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const DictionaryScreen(),
      ),
    );
  }

  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  final List<Map<String, dynamic>> _allWords = [
    {
      "id": 1,
      "title": "자녀",
      "wrongWord": "자",
      "mean": "설명 설명 설명",
      "socialMean": "설명 설명 설명",
      "reason": "설명 설명 설명",
      "isScraped": true,
    },
    {
      "id": 2,
      "title": "학부모",
      "wrongWord": "학부형",
      "mean": "설명 설명 설명",
      "socialMean": "설명 설명 설명",
      "reason": "설명 설명 설명",
      "isScraped": false,
    },
    {
      "id": 3,
      "title": "비혼",
      "wrongWord": "미혼",
      "mean": "설명 설명 설명",
      "socialMean": "설명 설명 설명",
      "reason": "설명 설명 설명",
      "isScraped": false,
    },
    {
      "id": 4,
      "title": "윗수",
      "wrongWord": "분자",
      "mean": "설명 설명 설명",
      "socialMean": "설명 설명 설명",
      "reason": "설명 설명 설명",
      "isScraped": false,
    },
    {
      "id": 5,
      "title": "아랫수",
      "wrongWord": "분모",
      "mean": "설명 설명 설명",
      "socialMean": "설명 설명 설명",
      "reason": "설명 설명 설명",
      "isScraped": true
    },
    {
      "id": 6,
      "title": "스포츠정신",
      "wrongWord": "스포츠맨십",
      "mean": "설명 설명 설명",
      "socialMean": "설명 설명 설명",
      "reason": "설명 설명 설명",
      "isScraped": true
    },
  ];

  List<Map<String, dynamic>> _foundWords = [];

  @override
  initState() {
    _foundWords = _allWords;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allWords;
    } else {
      results = _allWords
          .where((word) => word["title"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundWords = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("바른말 사전"),
        toolbarHeight: 38,
        backgroundColor: const Color(0xff6667AB),
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 12.0, bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    onChanged: (value) => _runFilter(value),
                    decoration: const InputDecoration(
                      hintText: "Search for a word",
                      contentPadding: EdgeInsets.only(left: 24.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, color: Colors.white),
                iconSize: 30,
              )
            ],
          ),
        ),
      ),
      body: _foundWords.isNotEmpty
          ? ListView.builder(
              itemCount: _foundWords.length,
              itemBuilder: (context, index) => DictionaryContainer(
                title: _foundWords[index]["title"],
                wrongWord: _foundWords[index]["wrongWord"],
                mean: _foundWords[index]["mean"],
                socialMean: _foundWords[index]["socialMean"],
                reason: _foundWords[index]["reason"],
                isScraped: _foundWords[index]["isScraped"],
              ),
            )
          : const Center(
              child: Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ImageSourceTypeScreen.show(context),
        backgroundColor: const Color(0xff6667AB),
        child: const Icon(Icons.photo_library_outlined),
      ),
    );
  }
}
