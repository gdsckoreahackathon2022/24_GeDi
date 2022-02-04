import 'package:flutter/material.dart';

class DictionaryContainer extends StatelessWidget {
  const DictionaryContainer({
    Key? key,
    required this.title,
    required this.wrongWord,
    required this.mean,
    required this.socialMean,
    required this.reason,
    required this.isScraped,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final String wrongWord;
  final String mean;
  final String socialMean;
  final String reason;
  final bool isScraped;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 280,
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          iconSize: 45,
                          icon: isScraped
                              ? const Icon(
                                  Icons.star_rounded,
                                  color: Colors.yellow,
                                )
                              : const Icon(
                                  Icons.star_outline_rounded,
                                  color: Colors.black45,
                                ),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "잘못된 어휘",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xffa3a4cd),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 12,
                              ),
                              child: Text(
                                wrongWord,
                                style: const TextStyle(
                                  color: Colors.yellow,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: DescriptionContainer(
                title: "단어 의미",
                description: mean,
              ),
            ),
            Expanded(
              flex: 1,
              child: DescriptionContainer(
                title: "사회적 의미",
                description: socialMean,
              ),
            ),
            Expanded(
              flex: 1,
              child: DescriptionContainer(
                title: "잘못된 이유",
                description: reason,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DescriptionContainer extends StatelessWidget {
  const DescriptionContainer({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xff6667ab),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
