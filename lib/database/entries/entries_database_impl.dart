import 'dart:async';
import 'dart:math';

import 'package:flutter_mixture/common/entities/entry.dart';
import 'package:flutter_mixture/common/entities/update_event.dart';
import 'package:flutter_mixture/database/entries/entries_database.dart';

class EntriesDatabaseImpl implements EntriesDatabase {
  final List<Entry> entriesList = [
    Entry(
        id: 0,
        title: "great start",
        content: "Started to learn flutter",
        created: 1617409417245,
        modified: 1617409417245),
    Entry(
        id: 1,
        title: "first steps",
        content: "Created app project",
        created: 1617509417245,
        modified: 1617509417245),
    Entry(
        id: 2,
        title: "testing",
        content: "Added few entries",
        created: 1617609417245,
        modified: 1617609417245),
  ];
  final StreamController<UpdateEvent> updates = StreamController.broadcast();

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
    updates.add(UpdateEvent());
    return entry;
  }

  @override
  delete(Entry entry) {
    storage.remove(entry.id);
    updates.add(UpdateEvent());
  }

  @override
  Entry? read(entryId) => storage[entryId];

  @override
  Entry update(Entry entry) {
    storage.update(entry.id, (value) => entry);
    updates.add(UpdateEvent());
    return entry;
  }

  @override
  List<Entry> readAll() {
    var list = storage.values.toList();
    list.sort((f, s) => s.created - f.created);
    return list;
  }

  @override
  Stream<UpdateEvent> listenUpdates() => updates.stream;

  dispose() {
    updates.close();
  }
}
