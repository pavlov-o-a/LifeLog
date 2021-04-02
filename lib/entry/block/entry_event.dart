import 'package:flutter_mixture/common/entities/entry.dart';

abstract class EntryEvent {}

class EntryEventLoad extends EntryEvent {}

class EntryEventEdit extends EntryEvent {}

class EntryEventSave extends EntryEvent {
  Entry modified;

  EntryEventSave(this.modified);
}

class EntryEventCreate extends EntryEvent {
  Entry created;

  EntryEventCreate(this.created);
}

class EntryEventShow extends EntryEvent {}
