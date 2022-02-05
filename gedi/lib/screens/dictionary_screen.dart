import 'package:flutter/material.dart';
import 'package:gedi/models/dictionary.dart';
import 'package:gedi/screens/image_source_type_screen.dart';
import 'package:gedi/utils/database.dart';
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
  List<Dictionary> _allWords = [];
  List<Dictionary> _foundWords = [];
  late Stream<List<Dictionary>> streamData;
  bool isSearched = false;

  @override
  initState() {
    final database = FirestoreDatabase();
    streamData = database.dictionaryStream();
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Dictionary> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allWords;
    } else {
      results = _allWords
          .where((word) => word
              .toMap()["title"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      print(results);
    }
    isSearched = true;

    setState(() {
      _foundWords = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: StreamBuilder<List<Dictionary>>(
          stream: streamData,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.green,
                ),
              );
            }
            _allWords = snapshot.data!;
            if (!isSearched) {
              _foundWords = _allWords;
            }
            return _foundWords.isNotEmpty
                ? ListView.builder(
                    itemCount: _foundWords.length,
                    itemBuilder: (context, index) => DictionaryContainer(
                      title: _foundWords[index].toMap()["title"],
                      wrongWord: _foundWords[index].toMap()["wrongWord"],
                      mean: _foundWords[index].toMap()["mean"],
                      socialMean: _foundWords[index].toMap()["socialMean"],
                      reason: _foundWords[index].toMap()["reason"],
                      isScraped: _foundWords[index].toMap()["isScraped"],
                    ),
                  )
                : const Center(
                    child: Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
                  );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ImageSourceTypeScreen.show(context),
        backgroundColor: const Color(0xff6667AB),
        child: const Icon(Icons.photo_library_outlined),
      ),
    );
  }
}
