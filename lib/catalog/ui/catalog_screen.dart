import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mixture/catalog/bloc/catalog_block.dart';
import 'package:flutter_mixture/catalog/bloc/catalog_event.dart';
import 'package:flutter_mixture/catalog/bloc/catalog_state.dart';
import 'package:flutter_mixture/catalog/repository/catalog_entries_provider.dart';
import 'package:flutter_mixture/common/entities/entry.dart';
import 'package:flutter_mixture/entry/entities/stateful_entry.dart';
import 'package:flutter_mixture/settings/settings_screen.dart';
import 'package:provider/provider.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatalogBlock(context.read<CatalogEntriesProvider>()),
      child: Scaffold(
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
        body: CatalogBody(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, '/entry', arguments: {
              'entry_extra': StatefulEntry.withState(
                  Entry("New entry"), EntryState.CHANGING)
            });
          },
        ),
      ),
    );
  }
}

class CatalogBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBlock, CatalogState>(
      builder: (context, state) {
        if (state is CatalogStateData) {
          return ListView.builder(
            itemBuilder: getEntryWidgetBuilder(context, state.data),
            itemCount: state.data.length,
          );
        } else if (state is CatalogStateError) {
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
        } else {
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
      return TextButton(
        child: Text(entries[int].title),
        onPressed: () {
          Navigator.pushNamed(context, '/entry',
              arguments: {'entry_extra': StatefulEntry(entries[int])});
        },
      );
    };
  }
}
