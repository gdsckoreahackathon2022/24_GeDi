class Dictionary {
  Dictionary({
    required this.id,
    required this.title,
    required this.wrongWord,
    required this.mean,
    required this.socialMean,
    required this.reason,
    required this.isScraped,
  });

  final String id;
  final String title;
  final String wrongWord;
  final String mean;
  final String socialMean;
  final String reason;
  final bool isScraped;

  factory Dictionary.fromMap(Map<String, dynamic> data, String id) {
    return Dictionary(
      id: id,
      title: data['title'],
      wrongWord: data['wrongWord'],
      mean: data['mean'],
      socialMean: data['socialMean'],
      reason: data['reason'],
      isScraped: data['isScraped'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'wrongWord': wrongWord,
      'mean': mean,
      'socialMean': socialMean,
      'reason': reason,
      'isScraped': isScraped,
    };
  }
}
