import 'package:flutter_mixture/entry/entities/StatefulEntry.dart';

abstract class CatalogViewModel {
  loadEntries();

  Stream<List<StatefulEntry>> getEntries();

  Stream<bool> isLoading();

  Stream<String?> getError();

  dispose();
}
