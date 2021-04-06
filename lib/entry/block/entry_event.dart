import 'package:flutter_mixture/common/entities/entry.dart';

abstract class EntryEvent {
  String getName();
}

const String entryEventLoad = "entryEventLoad";

class EntryEventLoad extends EntryEvent {
  @override
  String getName() => entryEventLoad;
}

const String entryEventEdit = "entryEventEdit";

class EntryEventEdit extends EntryEvent {
  @override
  String getName() => entryEventEdit;
}

const String entryEventSave = "entryEventSave";

class EntryEventSave extends EntryEvent {
  Entry modified;

  EntryEventSave(this.modified);

  @override
  String getName() => entryEventSave;
}

const String entryEventShow = "entryEventShow";

class EntryEventShow extends EntryEvent {
  @override
  String getName() => entryEventShow;
}
