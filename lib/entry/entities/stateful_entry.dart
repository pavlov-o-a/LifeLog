import 'package:flutter/material.dart';
import 'package:flutter_mixture/common/entities/entry.dart';

class StatefulEntry extends ChangeNotifier {
  Entry entry;
  EntryState state = EntryState.SHOWING;

  StatefulEntry(this.entry);

  StatefulEntry.withState(this.entry, this.state);

  setState(state) {
    this.state = state;
    notifyListeners();
  }
}

enum EntryState { CHANGING, SHOWING }
