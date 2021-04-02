import 'package:flutter_mixture/common/utils.dart';

class Entry {
  int id = -1;
  int created = 0;
  int modified = 0;
  String title = "";
  String content = "";

  Entry(
      {int? id, int? created, int? modified, String? title, String? content}) {
    this.id = id ?? this.id;
    this.created = created ?? this.created;
    this.modified = modified ?? this.modified;
    this.title = title ?? this.title;
    this.content = content ?? this.content;
  }

  Entry.create();

  Entry copy({Also? also}) {
    var copied = Entry(
        id: this.id,
        created: this.created,
        modified: this.modified,
        title: this.title,
        content: this.content);
    if (also != null) copied = also(copied);
    return copied;
  }
}
