import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mixture/catalog/ui/catalog_screen.dart';
import 'package:flutter_mixture/entry/ui/entry_screen.dart';
import 'package:flutter_mixture/settings/settings_screen.dart';

import 'global_providers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: globalProviders(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routes: {
          '/catalog': (context) => CatalogScreen(),
          '/entry': (context) => EntryScreen(),
          '/settings': (context) => SettingsScreen(),
        },
        initialRoute: '/catalog',
      ),
    );
  }
}
