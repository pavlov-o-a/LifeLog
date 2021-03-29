import 'package:flutter/material.dart';
import 'package:flutter_mixture/entry/entities/StatefulEntry.dart';
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
                  var entry =
                      Provider.of<StatefulEntry>(context, listen: false);
                  entry.setState(EntryState.SHOWING);
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
