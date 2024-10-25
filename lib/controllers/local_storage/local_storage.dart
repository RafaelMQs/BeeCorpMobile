enum LocalStorageResult { saved, deleted, failed, alreadyExists }

abstract class LocalStorage {
  Future<void> init();
  LocalStorageResult saveString(String key, String value);
  String? getString(String key);
  LocalStorageResult removeData(String key);
}
