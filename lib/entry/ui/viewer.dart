import 'package:flutter/material.dart';
import 'package:flutter_mixture/common/entities/entry.dart';
import 'package:flutter_mixture/entry/block/entry_block.dart';
import 'package:flutter_mixture/entry/block/entry_event.dart';
import 'package:provider/provider.dart';

class Viewer extends StatelessWidget {
  final Entry entry;

  Viewer(this.entry);

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<EntryBlock>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              editPressed(bloc);
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Text(
                entry.title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              width: double.infinity,
            ),
            Container(
              child: Text(entry.content),
              width: double.infinity,
              margin: EdgeInsets.only(top: 16),
            ),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
        margin: EdgeInsets.all(16),
      ),
    );
  }

  editPressed(EntryBlock bloc) {
    bloc.add(EntryEventEdit());
  }
}
