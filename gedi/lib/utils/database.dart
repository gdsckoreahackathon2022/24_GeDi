import 'package:gedi/models/dictionary.dart';
import 'package:gedi/utils/api_path.dart';
import 'package:gedi/utils/firestore_service.dart';

abstract class Database {
  // Stream<AccountInfo> accountStream();
  // Future<void> setAccountInfo(AccountInfo accountInfo);

  Stream<List<Dictionary>> dictionaryStream();
}

class FirestoreDatabase implements Database {
  // FirestoreDatabase({required this.uid}) : assert(uid != null);
  // final String uid;

  final _service = FirestoreService.instance;

  // @override
  // Stream<AccountInfo> accountStream() => _service.documentStream(
  //       path: APIPath.accountInfo(uid),
  //       builder: (data, documentId) => AccountInfo.fromMap(data, documentId),
  //     );
  // @override
  // Future<void> setAccountInfo(AccountInfo accountInfo) => _service.setData(
  //       path: APIPath.accountInfo(uid),
  //       data: accountInfo.toMap(),
  //     );

  @override
  Stream<List<Dictionary>> dictionaryStream() => _service.collectionStream(
        path: APIPath.dictionaries(),
        builder: (data, documentId) => Dictionary.fromMap(data, documentId),
      );
}
