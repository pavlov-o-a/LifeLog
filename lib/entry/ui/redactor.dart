import 'package:flutter/material.dart';
import 'package:flutter_mixture/entry/block/entry_block.dart';
import 'package:flutter_mixture/entry/block/entry_event.dart';
import 'package:provider/provider.dart';

class Redactor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RedactorState();
  }
}

class RedactorState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  context.read<EntryBlock>().add(EntryEventSave());
                },
                child: Text(
                  "save",
                  style: TextStyle(color: Colors.red),
                ))
          ],
        ),
        body: Center(
          child: Text("This screen allows to edit post"),
        ));
  }
}
