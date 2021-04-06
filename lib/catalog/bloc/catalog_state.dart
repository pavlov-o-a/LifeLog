import 'package:flutter_mixture/common/entities/entry.dart';

abstract class CatalogState {
  String getName();
}

const String catalogStateOpen = "catalogStateOpen";

class CatalogStateOpen extends CatalogState {
  @override
  String getName() => catalogStateOpen;
}

const String catalogStateLoading = "catalogStateLoading";

class CatalogStateLoading extends CatalogState {
  @override
  String getName() => catalogStateLoading;
}

const String catalogStateData = "catalogStateData";

class CatalogStateData extends CatalogState {
  List<Entry> data;

  CatalogStateData(this.data);

  @override
  String getName() => catalogStateData;
}

const String catalogStateError = "catalogStateError";

class CatalogStateError extends CatalogState {
  String error;

  CatalogStateError(this.error);

  @override
  String getName() => catalogStateError;
}

const String catalogStateEmpty = "catalogStateEmpty";

class CatalogStateEmpty extends CatalogState {
  @override
  String getName() => catalogStateEmpty;
}
