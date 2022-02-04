class APIPath {
  // static String accountInfo(String uid) => 'users/$uid';

  static String dictionaries() => 'dictionary';
  static String dictionary(String dictionaryId) => 'dictionary/$dictionaryId';
}

//파이어스토어 경로, 컬렉션/도큐먼트/... 순서로 이뤄짐