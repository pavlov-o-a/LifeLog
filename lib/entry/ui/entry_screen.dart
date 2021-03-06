import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mixture/entry/block/entry_block.dart';
import 'package:flutter_mixture/entry/block/entry_event.dart';
import 'package:flutter_mixture/entry/block/entry_state.dart';
import 'package:flutter_mixture/entry/repository/entry_provider.dart';
import 'package:flutter_mixture/entry/ui/redactor.dart';
import 'package:flutter_mixture/entry/ui/viewer.dart';

class EntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = (ModalRoute.of(context)?.settings.arguments as Map);
    int entryId = args['entry_extra'];
    return BlocProvider(
      create: (context) => EntryBlock(entryId, context.read<EntryProvider>()),
      child: BlocBuilder<EntryBlock, EntryState>(
        builder: (context, state) {
          switch (state.getName()) {
            case entryStateShow:
              state as EntryStateShow;
              return Viewer(state.entry);
            case entryStateEditSuccess:
              state as EntryStateEditSuccess;
              return Viewer(state.entry);
            case entryStateEditing:
              state as EntryStateEditing;
              return Redactor(state.entry);
            case entryStateLoading:
              context.read<EntryBlock>().add(EntryEventLoad());
              return EntryLoading();
            default:
              return EntryNotFound();
          }
        },
      ),
    );
  }
}

class EntryNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("Entry not found")),
    );
  }
}

class EntryLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
