import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mixture/catalog/bloc/catalog_block.dart';
import 'package:flutter_mixture/catalog/bloc/catalog_event.dart';
import 'package:flutter_mixture/catalog/bloc/catalog_state.dart';
import 'package:flutter_mixture/catalog/repository/catalog_entries_provider.dart';
import 'package:flutter_mixture/common/entities/entry.dart';
import 'package:flutter_mixture/settings/settings_screen.dart';
import 'package:provider/provider.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CatalogBlock>(
      create: (context) => CatalogBlock(context.read<CatalogEntriesProvider>()),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            ReloadButton(),
            //todo move settings out of catalog
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SettingsScreen();
                }));
              },
            )
          ],
        ),
        body: CatalogBody(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, '/entry', arguments: {
              'entry_extra': -1,
            });
          },
        ),
      ),
    );
  }
}

class ReloadButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.sync),
        onPressed: () {
          context.read<CatalogBlock>().add(CatalogEventReload());
        });
  }
}

class CatalogBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBlock, CatalogState>(
      builder: (context, state) {
        switch (state.getName()) {
          case catalogStateData:
            state as CatalogStateData;
            return ListView.builder(
              itemBuilder: getEntryWidgetBuilder(context, state.data),
              itemCount: state.data.length,
            );
          case catalogStateError:
            state as CatalogStateError;
            return Container(
              child: Column(
                children: [
                  Text(state.error),
                  TextButton(
                      onPressed: () {
                        context.read<CatalogBlock>().add(CatalogEventReload());
                      },
                      child: Text("Try again"))
                ],
                mainAxisSize: MainAxisSize.min,
              ),
              alignment: Alignment.center,
            );
          default:
            if (state is CatalogStateOpen) {
              context.read<CatalogBlock>().add(CatalogEventLoad());
            }
            return Container(
              child: CircularProgressIndicator(),
              alignment: Alignment.center,
            );
        }
      },
    );
  }

  IndexedWidgetBuilder getEntryWidgetBuilder(context, List<Entry> entries) {
    return (context, int) {
      var title = entries[int].title;
      var date = DateTime.fromMillisecondsSinceEpoch(entries[int].created);
      var created = "${date.day}.${date.month}.${date.year}";
      return Container(
        child: TextButton(
          child: Column(
            children: [
              Container(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
                width: double.infinity,
              ),
              Text(
                created,
                style: TextStyle(fontSize: 10, color: Colors.black38),
              ),
            ],
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/entry',
                arguments: {'entry_extra': entries[int].id});
          },
        ),
        alignment: Alignment.centerLeft,
      );
    };
  }
}
