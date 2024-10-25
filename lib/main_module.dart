import 'package:bee_corp_app/controllers/local_storage/local_storage.dart';
import 'package:bee_corp_app/controllers/local_storage/local_storage_controller.dart';
import 'package:get_it/get_it.dart';

class MainModule {
  static void init() {
    GetIt.I.registerSingletonAsync<LocalStorage>(
        () async => LocalStorageController()..init());
  }
}
