import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mixture/common/entities/entry.dart';
import 'package:flutter_mixture/entry/block/entry_event.dart';
import 'package:flutter_mixture/entry/block/entry_state.dart';
import 'package:flutter_mixture/entry/repository/entry_provider.dart';

class EntryBlock extends Bloc<EntryEvent, EntryState> {
  int entryId;
  EntryProvider entryProvider;

  EntryBlock(this.entryId, this.entryProvider) : super(EntryStateLoading());

  @override
  Stream<EntryState> mapEventToState(EntryEvent event) async* {
    var entry = entryProvider.read(entryId);
    if (entry != null) {
      if (event is EntryEventEdit)
        yield EntryStateEditing(entry);
      else if (event is EntryEventSave) {
        try {
          entryProvider.save(event.modified);
        } catch (exc) {}
        ;
        yield EntryStateEditSuccess(event.modified);
      } else
        yield EntryStateShow(entry);
    } else {
      if (event is EntryEventSave) {
        try {
          var created = entryProvider.create(event.modified);
          yield EntryStateEditSuccess(created);
        } catch (exc) {
          yield EntryStateLoading();
        }
      } else {
        yield EntryStateEditing(Entry());
      }
    }
  }
}
