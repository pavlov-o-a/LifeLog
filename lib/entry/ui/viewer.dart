import 'package:flutter/material.dart';
import 'package:flutter_mixture/entry/block/entry_block.dart';
import 'package:flutter_mixture/entry/block/entry_event.dart';
import 'package:provider/provider.dart';

class Viewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  context.read<EntryBlock>().add(EntryEventEdit());
                },
                child: Text(
                  "edit",
                  style: TextStyle(color: Colors.red),
                ))
          ],
        ),
        body: Center(
          child: Text("This screen is just showing post"),
        ));
  }
}
