import 'package:flutter_mixture/common/entities/entry.dart';

abstract class EntryProvider {
  save(Entry entry);

  Entry create(Entry entry);

  Entry? read(int entryId);
}
