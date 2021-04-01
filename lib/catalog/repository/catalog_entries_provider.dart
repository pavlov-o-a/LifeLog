import 'package:flutter_mixture/common/entities/entry.dart';

abstract class CatalogEntriesProvider {
  Future<List<Entry>> getEntries();
}
