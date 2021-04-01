import 'dart:math';

import 'package:flutter_mixture/catalog/repository/catalog_entries_provider.dart';
import 'package:flutter_mixture/common/entities/entry.dart';

class CatalogEntriesProviderImpl implements CatalogEntriesProvider {
  final List<Entry> entriesList = [
    Entry("Started to learn flutter"),
    Entry("Created app project"),
    Entry("Added few entries")
  ];

  @override
  Future<List<Entry>> getEntries() {
    return Future.delayed(Duration(seconds: 2), () {
      if (Random.secure().nextBool())
        return entriesList;
      else
        throw Exception("Some unexpected exception");
    });
  }
}
