import 'package:flutter/material.dart';
import 'package:flutter_mixture/common/entities/entry.dart';
import 'package:flutter_mixture/entry/block/entry_block.dart';
import 'package:flutter_mixture/entry/block/entry_event.dart';
import 'package:provider/provider.dart';

class Redactor extends StatelessWidget {
  final Entry entry;

  Redactor(this.entry);

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<EntryBlock>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            cancelEditingPressed(bloc);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              savePressed(bloc, entry);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: TextField(
                decoration: InputDecoration(hintText: "Title"),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                controller: TextEditingController(text: entry.title),
                onChanged: (value) {
                  titleChanged(value, entry);
                },
              ),
              width: double.infinity,
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(hintText: "Content"),
                controller: TextEditingController(text: entry.content),
                onChanged: (value) {
                  contentChanged(value, entry);
                },
              ),
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

  cancelEditingPressed(EntryBlock bloc) {
    bloc.add(EntryEventShow());
  }

  savePressed(EntryBlock bloc, Entry entry) {
    bloc.add(EntryEventSave(entry));
  }

  titleChanged(String value, Entry entry) {
    entry.title = value;
  }

  contentChanged(String value, Entry entry) {
    entry.content = value;
  }
}
