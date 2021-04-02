import 'package:flutter_mixture/common/entities/entry.dart';

abstract class EntryState {}

class EntryStateLoading extends EntryState {}

class EntryStateEditing extends EntryState {
  final Entry entry;

  EntryStateEditing(this.entry);
}

class EntryStateShow extends EntryState {
  final Entry entry;

  EntryStateShow(this.entry);
}

class EntryStateEditSuccess extends EntryState {
  final Entry entry;

  EntryStateEditSuccess(this.entry);
}
