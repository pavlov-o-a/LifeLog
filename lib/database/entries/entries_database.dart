import 'package:flutter_mixture/common/entities/entry.dart';

abstract class EntriesDatabase {
  Entry create(Entry entry);

  Entry? read(entryId);

  Entry update(Entry entry);

  delete(Entry entry);

  List<Entry> readAll();

  Stream<Object> listenUpdates();
}
