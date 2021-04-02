import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mixture/catalog/repository/catalog_entries_provider.dart';
import 'package:flutter_mixture/catalog/repository/catalog_entries_provider_impl.dart';
import 'package:flutter_mixture/database/entries/entries_database.dart';
import 'package:flutter_mixture/database/entries/entries_database_impl.dart';
import 'package:flutter_mixture/entry/repository/entry_provider.dart';
import 'package:flutter_mixture/entry/repository/entry_provider_impl.dart';

List<RepositoryProvider> globalProviders() {
  return [
    RepositoryProvider<EntriesDatabase>(
        create: (context) => EntriesDatabaseImpl()),
    RepositoryProvider<CatalogEntriesProvider>(
        create: (context) =>
            CatalogEntriesProviderImpl(context.read<EntriesDatabase>())),
    RepositoryProvider<EntryProvider>(
      create: (context) => EntryProviderImpl(context.read<EntriesDatabase>()),
    ),
  ];
}
