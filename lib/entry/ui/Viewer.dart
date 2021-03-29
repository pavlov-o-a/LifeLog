import 'package:flutter/material.dart';
import 'package:flutter_mixture/entry/entities/StatefulEntry.dart';
import 'package:provider/provider.dart';

class Viewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  var entry =
                      Provider.of<StatefulEntry>(context, listen: false);
                  entry.setState(EntryState.CHANGING);
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
