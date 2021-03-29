import 'package:flutter/material.dart';
import 'package:flutter_mixture/catalog/CatalogScreen.dart';
import 'package:flutter_mixture/entry/ui/EntryScreen.dart';
import 'package:flutter_mixture/settings/SettingsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
