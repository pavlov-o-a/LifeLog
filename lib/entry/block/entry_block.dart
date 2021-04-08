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
    switch (event.getName()) {
      case entryEventEdit:
        if (entry != null) {
          yield EntryStateEditing(entry);
          break;
        } else
          continue save;
      save:
      case entryEventSave:
        event as EntryEventSave;
        if (entry != null) {
          try {
            entryProvider.save(event.modified);
          } catch (exc) {}
          yield EntryStateEditSuccess(event.modified);
        } else {
          try {
            event.modified.created = DateTime.now().millisecondsSinceEpoch;
            event.modified.modified = event.modified.created;
            var created = entryProvider.create(event.modified);
            yield EntryStateEditSuccess(created);
          } catch (exc) {
            yield EntryStateLoading();
          }
        }
        break;
      default:
        if (entry != null) {
          yield EntryStateShow(entry);
        } else {
          yield EntryStateEditing(Entry());
        }
    }
  }
}
