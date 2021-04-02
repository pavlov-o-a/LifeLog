import 'dart:async';
import 'dart:math';

import 'package:flutter_mixture/common/entities/entry.dart';
import 'package:flutter_mixture/database/entries/entries_database.dart';

class EntriesDatabaseImpl implements EntriesDatabase {
  final List<Entry> entriesList = [
    Entry(id: 0, title: "great start", content: "Started to learn flutter"),
    Entry(id: 1, title: "first steps", content: "Created app project"),
    Entry(id: 2, title: "testing", content: "Added few entries"),
  ];
  final StreamController<Object> updates = StreamController.broadcast();

  late Map<int, Entry> storage;

  EntriesDatabaseImpl() {
    var map = Map<int, Entry>();
    map.addEntries(entriesList.map((e) => MapEntry(e.id, e)));
    storage = map;
  }

  @override
  Entry create(Entry entry) {
    var id = storage.keys.reduce(max) + 1;
    entry.id = id;
    storage.update(id, (value) => entry, ifAbsent: () => entry);
    return entry;
  }

  @override
  delete(Entry entry) {
    storage.remove(entry.id);
    updates.add("");
  }

  @override
  Entry? read(entryId) => storage[entryId];

  @override
  Entry update(Entry entry) {
    storage.update(entry.id, (value) => entry);
    updates.add("");
    return entry;
  }

  @override
  List<Entry> readAll() => storage.values.toList();

  @override
  Stream<Object> listenUpdates() => updates.stream;

  dispose() {
    updates.close();
  }
}
