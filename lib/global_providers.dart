import 'package:flutter_bloc/flutter_bloc.dart';

import 'catalog/repository/catalog_entries_provider.dart';
import 'catalog/repository/catalog_entries_provider_impl.dart';

List<RepositoryProvider> globalProviders() {
  return [
    RepositoryProvider<CatalogEntriesProvider>(
        create: (context) => CatalogEntriesProviderImpl())
  ];
}
