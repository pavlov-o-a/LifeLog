import 'package:flutter_mixture/common/entities/entry.dart';
import 'package:flutter_mixture/common/entities/update_event.dart';

abstract class EntriesDatabase {
  Entry create(Entry entry);

  Entry? read(entryId);

  Entry update(Entry entry);

  delete(Entry entry);

  List<Entry> readAll();

  Stream<UpdateEvent> listenUpdates();
}
