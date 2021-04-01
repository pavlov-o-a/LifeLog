import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mixture/common/entities/entry.dart';
import 'package:flutter_mixture/entry/block/entry_block.dart';
import 'package:flutter_mixture/entry/block/entry_state.dart';
import 'package:flutter_mixture/entry/ui/redactor.dart';
import 'package:flutter_mixture/entry/ui/viewer.dart';

class EntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Entry entry =
        (ModalRoute.of(context)?.settings.arguments as Map)['entry_extra'];
    return BlocProvider(
      create: (context) => EntryBlock(entry, EntryStateShow()),
      child: BlocBuilder<EntryBlock, EntryState>(
        builder: (context, state) {
          if (state is EntryStateShow)
            return Viewer();
          else
            return Redactor();
        },
      ),
    );
  }
}
