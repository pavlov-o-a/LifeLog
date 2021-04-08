import 'package:flutter_mixture/common/entities/entry.dart';
import 'package:flutter_mixture/synchronize/synchronize.dart';

class GoogleDriveSync extends SyncDestination {
  @override
  export(List<Entry> entries) {}

  @override
  List<Entry> import() {
    return List.empty();
  }
}
