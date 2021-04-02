import 'dart:math';

import 'package:flutter_mixture/catalog/repository/catalog_entries_provider.dart';
import 'package:flutter_mixture/common/entities/entry.dart';
import 'package:flutter_mixture/database/entries/entries_database.dart';

class CatalogEntriesProviderImpl implements CatalogEntriesProvider {
  EntriesDatabase database;

  CatalogEntriesProviderImpl(this.database);

  @override
  Future<List<Entry>> getEntries() {
    return Future.delayed(Duration(seconds: 2), () {
      if (Random.secure().nextDouble() > 0.25)
        return database.readAll();
      else
        throw Exception("Some unexpected exception");
    });
  }

  @override
  Stream<Object> listenUpdates() => database.listenUpdates();
}
