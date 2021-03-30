import 'dart:async';

import 'package:flutter_mixture/catalog/CatalogViewModel.dart';
import 'package:flutter_mixture/common/entities/Entry.dart';
import 'package:flutter_mixture/entry/entities/StatefulEntry.dart';

class CatalogViewModelImpl implements CatalogViewModel {
  var entriesController = StreamController<List<StatefulEntry>>.broadcast();
  var entries = List<StatefulEntry>.empty();
  var loadingController = StreamController<bool>.broadcast();
  var loading = false;
  var errorController = StreamController<String?>.broadcast();
  String? error;

  CatalogViewModelImpl() {
    entriesController.stream.listen((event) {
      entries = event;
    });
    loadingController.stream.listen((event) {
      loading = event;
    });
    errorController.stream.listen((event) {
      error = event;
    });
  }

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
    loading = true;
    loadingController.add(true);
    //load entries
    await Future.delayed(Duration(seconds: 2));
    entriesController.add(entriesList);
    loading = false;
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
  List<StatefulEntry> getBufferedEntries() {
    return entries;
  }

  @override
  bool getBufferedLoading() {
    return loading;
  }

  @override
  String? getBufferedError() {
    return error;
  }

  @override
  dispose() {
    entriesController.close();
    loadingController.close();
    errorController.close();
  }
}
