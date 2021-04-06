import 'package:flutter_mixture/common/entities/entry.dart';

abstract class EntryState {
  String getName();
}

const entryStateLoading = "entryStateLoading";

class EntryStateLoading extends EntryState {
  @override
  String getName() => entryStateLoading;
}

const entryStateEditing = "entryStateEditing";

class EntryStateEditing extends EntryState {
  final Entry entry;

  EntryStateEditing(this.entry);

  @override
  String getName() => entryStateEditing;
}

const entryStateShow = "entryStateShow";

class EntryStateShow extends EntryState {
  final Entry entry;

  EntryStateShow(this.entry);

  @override
  String getName() => entryStateShow;
}

const entryStateEditSuccess = "entryStateEditSuccess";

class EntryStateEditSuccess extends EntryState {
  final Entry entry;

  EntryStateEditSuccess(this.entry);

  @override
  String getName() => entryStateEditSuccess;
}
