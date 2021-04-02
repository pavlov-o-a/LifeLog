import 'package:flutter_mixture/common/entities/entry.dart';
import 'package:flutter_mixture/database/entries/entries_database.dart';
import 'package:flutter_mixture/entry/repository/entry_provider.dart';

class EntryProviderImpl extends EntryProvider {
  EntriesDatabase database;

  EntryProviderImpl(this.database);

  @override
  Entry? read(int entryId) {
    return database.read(entryId);
  }

  @override
  Entry create(Entry entry) {
    return database.create(entry);
  }

  @override
  save(Entry entry) {
    database.update(entry);
  }
}
