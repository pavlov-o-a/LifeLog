abstract class CatalogEvent {
  String getName();
}

const String catalogEventLoad = "catalogEventLoad";

class CatalogEventLoad extends CatalogEvent {
  @override
  String getName() => catalogEventLoad;
}

const String catalogEventReload = "catalogEventReload";

class CatalogEventReload extends CatalogEvent {
  @override
  String getName() => catalogEventReload;
}
