import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mixture/catalog/bloc/catalog_event.dart';
import 'package:flutter_mixture/catalog/bloc/catalog_state.dart';
import 'package:flutter_mixture/catalog/repository/catalog_entries_provider.dart';

class CatalogBlock extends Bloc<CatalogEvent, CatalogState> {
  CatalogEntriesProvider? entriesProvider;

  CatalogBlock(this.entriesProvider) : super(CatalogStateOpen());

  @override
  Stream<CatalogState> mapEventToState(CatalogEvent event) async* {
    if (event is CatalogEventLoading)
      yield await loadData();
    else
      yield CatalogStateEmpty();
  }

  Future<CatalogState> loadData() {
    try {
      return entriesProvider!
          .getEntries()
          .then((value) => Future.value(CatalogStateData(value)));
    } catch (exc) {
      return Future.value(CatalogStateError(exc.toString()));
    }
  }
}
