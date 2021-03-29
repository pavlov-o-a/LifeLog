import 'package:flutter/material.dart';
import 'package:flutter_mixture/common/entities/Entry.dart';

class StatefulEntry extends ChangeNotifier {
  Entry entry;
  EntryState state = EntryState.SHOWING;

  StatefulEntry(this.entry);

  StatefulEntry.withState(entry, state) {
    this.entry = entry;
    this.state = state;
  }

  setState(state) {
    this.state = state;
    notifyListeners();
  }
}

enum EntryState { CHANGING, SHOWING }
