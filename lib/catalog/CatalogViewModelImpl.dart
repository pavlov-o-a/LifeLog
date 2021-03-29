import 'dart:async';

import 'package:flutter_mixture/catalog/CatalogViewModel.dart';
import 'package:flutter_mixture/common/entities/Entry.dart';
import 'package:flutter_mixture/entry/entities/StatefulEntry.dart';

class CatalogViewModelImpl implements CatalogViewModel {
  StreamController<List<StatefulEntry>> entries =
      StreamController<List<StatefulEntry>>.broadcast();

  @override
  Stream<List<StatefulEntry>> getEntries() {
    return entries.stream;
  }

  final List<StatefulEntry> entriesList = [
    StatefulEntry(Entry("Started to learn flutter")),
    StatefulEntry(Entry("Created app project")),
    StatefulEntry(Entry("Added few entries"))
  ];

  @override
  loadEntries() async {
    //load entries
    await Future.delayed(Duration(seconds: 2));
    entries.add(entriesList);
  }

  @override
  dispose() {
    entries.close();
  }
}
