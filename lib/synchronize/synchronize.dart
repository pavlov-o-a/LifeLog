import 'package:flutter_mixture/common/entities/entry.dart';

abstract class SyncDestination {
  export(List<Entry> entries);

  List<Entry> import();
}
