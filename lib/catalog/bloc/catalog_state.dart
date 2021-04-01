import 'package:flutter_mixture/common/entities/entry.dart';

abstract class CatalogState {}

class CatalogStateOpen extends CatalogState {}

class CatalogStateLoading extends CatalogState {}

class CatalogStateData extends CatalogState {
  List<Entry> data;

  CatalogStateData(this.data);
}

class CatalogStateError extends CatalogState {
  String error;

  CatalogStateError(this.error);
}

class CatalogStateEmpty extends CatalogState {}
