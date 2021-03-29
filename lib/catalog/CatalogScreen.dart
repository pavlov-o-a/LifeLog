import 'package:flutter/material.dart';
import 'package:flutter_mixture/catalog/CatalogViewModel.dart';
import 'package:flutter_mixture/catalog/CatalogViewModelImpl.dart';
import 'package:flutter_mixture/common/entities/Entry.dart';
import 'package:flutter_mixture/entry/entities/StatefulEntry.dart';
import 'package:flutter_mixture/entry/ui/EntryScreen.dart';
import 'package:flutter_mixture/settings/SettingsScreen.dart';
import 'package:provider/provider.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            child: Text(
              "settings",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SettingsScreen();
              }));
            },
          )
        ],
      ),
      body: Provider<CatalogViewModel>(
        create: (context) => CatalogViewModelImpl(),
        child: CatalogBody(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EntryScreen(StatefulEntry.withState(
                Entry("New entry"), EntryState.CHANGING));
          }));
        },
      ),
    );
  }
}

class CatalogBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListState();
  }
}

class ListState extends State<StatefulWidget> {
  CatalogViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<CatalogViewModel>(context, listen: false);
    viewModel.loadEntries();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, data) {
        List<StatefulEntry> entries = data.data;
        return ListView.builder(
          itemBuilder: getEntryWidgetBuilder(context, entries),
          itemCount: entries.length,
        );
      },
      stream: viewModel.getEntries(),
      initialData: List<StatefulEntry>.empty(),
    );
  }

  IndexedWidgetBuilder getEntryWidgetBuilder(context, entries) {
    return (context, int) {
      return TextButton(
        child: Text(entries[int].entry.title),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EntryScreen(entries[int]);
          }));
        },
      );
    };
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.dispose();
  }
}

class LoadingState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}
