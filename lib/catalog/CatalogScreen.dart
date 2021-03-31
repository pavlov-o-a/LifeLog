import 'package:flutter/material.dart';
import 'package:flutter_mixture/catalog/CatalogViewModel.dart';
import 'package:flutter_mixture/catalog/CatalogViewModelImpl.dart';
import 'package:flutter_mixture/common/entities/Entry.dart';
import 'package:flutter_mixture/entry/entities/StatefulEntry.dart';
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
          Navigator.pushNamed(context, '/entry', arguments: {
            'entry_extra':
                StatefulEntry.withState(Entry("New entry"), EntryState.CHANGING)
          });
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
  CatalogViewModel? viewModel;
  String? error;
  var showLoading = true;
  var entriesList = List<StatefulEntry>.empty();

  @override
  void initState() {
    super.initState();
    var viewModel = Provider.of<CatalogViewModel>(context, listen: false);
    this.viewModel = viewModel;
    viewModel.loadEntries();
    viewModel.getError().listen((event) {
      setState(() {
        error = event;
      });
    });
    print("stream init");
    viewModel.isLoading().listen((event) {
      setState(() {
        print("stream collected");
        showLoading = event;
      });
    });
    viewModel.getEntries().listen((event) {
      setState(() {
        entriesList = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemBuilder: getEntryWidgetBuilder(context, entriesList),
          itemCount: entriesList.length,
        ),
        Builder(builder: (context) {
          return showLoading == true
              ? Container(
                  child: CircularProgressIndicator(),
                  alignment: Alignment.center,
                )
              : SizedBox.shrink();
        }),
        Builder(builder: (context) {
          return error?.isNotEmpty == true
              ? Container(
                  child: Text(error!),
                )
              : SizedBox.shrink();
        }),
      ],
    );
  }

  IndexedWidgetBuilder getEntryWidgetBuilder(context, entries) {
    return (context, int) {
      return TextButton(
        child: Text(entries[int].entry.title),
        onPressed: () {
          Navigator.pushNamed(context, '/entry',
              arguments: {'entry_extra': entries[int]});
        },
      );
    };
  }

  @override
  void dispose() {
    super.dispose();
    viewModel?.dispose();
  }
}

class LoadingState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}
