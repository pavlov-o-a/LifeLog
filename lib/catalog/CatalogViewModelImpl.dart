import 'dart:async';

import 'package:flutter_mixture/catalog/CatalogViewModel.dart';
import 'package:flutter_mixture/common/entities/Entry.dart';
import 'package:flutter_mixture/entry/entities/StatefulEntry.dart';
import 'package:rxdart/rxdart.dart';

class CatalogViewModelImpl implements CatalogViewModel {
  var entriesController = ReplaySubject<List<StatefulEntry>>(maxSize: 1);
  var loadingController = ReplaySubject<bool>(maxSize: 1);
  var errorController = ReplaySubject<String?>(maxSize: 1);

  @override
  Stream<List<StatefulEntry>> getEntries() {
    return entriesController.stream;
  }

  final List<StatefulEntry> entriesList = [
    StatefulEntry(Entry("Started to learn flutter")),
    StatefulEntry(Entry("Created app project")),
    StatefulEntry(Entry("Added few entries"))
  ];

  @override
  loadEntries() async {
    loadingController.add(true);
    //load entries
    await Future.delayed(Duration(seconds: 2));
    entriesController.add(entriesList);
    loadingController.add(false);
  }

  @override
  Stream<bool> isLoading() {
    return loadingController.stream;
  }

  @override
  Stream<String?> getError() {
    return errorController.stream;
  }

  @override
  dispose() {
    entriesController.close();
    loadingController.close();
    errorController.close();
  }
}
