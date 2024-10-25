import 'package:bee_corp_app/controllers/local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageController extends LocalStorage {
  SharedPreferences? pref;

  @override
  Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  LocalStorageResult saveString(String key, String value) {
    if (pref == null) init();

    try {
      pref?.setString(key, value);
      return LocalStorageResult.saved;
    } catch (e) {
      return LocalStorageResult.failed;
    }
  }

  @override
  String? getString(String key) {
    if (pref == null) init();

    try {
      return pref?.getString(key) ?? "";
    } catch (e) {
      return "";
    }
  }

  @override
  LocalStorageResult removeData(String key) {
    if (pref == null) init();

    try {
      pref?.remove(key);
      return LocalStorageResult.deleted;
    } catch (e) {
      return LocalStorageResult.failed;
    }
  }
}
