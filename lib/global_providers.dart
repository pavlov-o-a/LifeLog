import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mixture/catalog/repository/catalog_entries_provider.dart';
import 'package:flutter_mixture/catalog/repository/catalog_entries_provider_impl.dart';

List<RepositoryProvider> globalProviders() {
  return [
    RepositoryProvider<CatalogEntriesProvider>(
        create: (context) => CatalogEntriesProviderImpl())
  ];
}
