import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mixture/common/entities/entry.dart';
import 'package:flutter_mixture/entry/block/entry_event.dart';
import 'package:flutter_mixture/entry/block/entry_state.dart';

class EntryBlock extends Bloc<EntryEvent, EntryState> {
  Entry entry;

  EntryBlock(this.entry, EntryState initialState) : super(initialState);

  @override
  Stream<EntryState> mapEventToState(EntryEvent event) async* {
    if (event is EntryEventEdit)
      yield EntryStateEditing();
    else
      yield EntryStateShow();
  }

  Entry getEntry() => entry;
}
