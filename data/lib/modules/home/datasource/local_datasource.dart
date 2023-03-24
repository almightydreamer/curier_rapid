import 'package:data/core/db/db.dart';

class LocalDataSource {
  final LocalDatabase db;

  const LocalDataSource({required this.db});

  /*Stream<List<SomethingLocalDTO>> retrieveSomething() async* {}

  Future<Map<int, List<String>>> getSomethingTagsById(List<int> somethingIds) async {}

  Future<void> saveSomething(List<SomethingLocalDTO> something) async {}*/
}
