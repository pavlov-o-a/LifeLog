import 'package:flutter/material.dart';
import 'package:flutter_mixture/entry/entities/StatefulEntry.dart';
import 'package:flutter_mixture/entry/ui/Redactor.dart';
import 'package:flutter_mixture/entry/ui/Viewer.dart';
import 'package:provider/provider.dart';

class EntryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    StatefulEntry entry =
        (ModalRoute.of(context)?.settings.arguments as Map)['entry_extra'];
    return ChangeNotifierProvider<StatefulEntry>.value(
        value: entry,
        child: Consumer<StatefulEntry>(
          builder: (context, entry, child) {
            if (entry.state == EntryState.SHOWING)
              return Viewer();
            else
              return Redactor();
          },
        ));
  }
}
