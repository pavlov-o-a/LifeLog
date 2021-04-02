import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mixture/catalog/bloc/catalog_event.dart';
import 'package:flutter_mixture/catalog/bloc/catalog_state.dart';
import 'package:flutter_mixture/catalog/repository/catalog_entries_provider.dart';

class CatalogBlock extends Bloc<CatalogEvent, CatalogState> {
  CatalogEntriesProvider? entriesProvider;
  late StreamSubscription<Object>? updatesListener;

  CatalogBlock(this.entriesProvider) : super(CatalogStateOpen()) {
    updatesListener = entriesProvider?.listenUpdates().listen((event) {
      add(CatalogEventReload());
    });
  }

  @override
  Stream<CatalogState> mapEventToState(CatalogEvent event) async* {
    if (event is CatalogEventLoad)
      yield await loadData();
    else if (event is CatalogEventReload) {
      yield CatalogStateLoading();
      yield await loadData();
    } else
      yield CatalogStateEmpty();
  }

  Future<CatalogState> loadData() {
    return entriesProvider!.getEntries().then(
        (value) => Future.value(CatalogStateData(value)),
        onError: (error) => Future.value(CatalogStateError(error.toString())));
  }

  @override
  Future<void> close() {
    updatesListener?.cancel();
    return super.close();
  }
}
