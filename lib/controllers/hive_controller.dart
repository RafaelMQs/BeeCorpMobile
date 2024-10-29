import 'dart:convert';

import 'package:bee_corp_app/controllers/local_storage/local_storage.dart';
import 'package:bee_corp_app/models/hive_model.dart';
import 'package:get_it/get_it.dart';

const String LIST_OF_HIVES_KEY = 'LIST_OF_HIVES_KEY';

class HiveController {
  LocalStorageResult saveHive(HiveModel hiveModel) {
    List<HiveModel> hiveModelList = [...getHives(), hiveModel];

    final String dateToBeSaved = jsonEncode(
        hiveModelList.map((hiveModel) => hiveModel.toMap()).toList());

    final result = GetIt.I
        .get<LocalStorage>()
        .saveString(LIST_OF_HIVES_KEY, dateToBeSaved);

    return result;
  }

  List<HiveModel> getHives() {
    final result = GetIt.I.get<LocalStorage>().getString(LIST_OF_HIVES_KEY);

    if (result!.isNotEmpty) {
      final dateFromStorage = (jsonDecode(result) as List)
          .map<HiveModel>((hiveModelMap) => HiveModel.fromMap(hiveModelMap))
          .toList();

      return dateFromStorage;
    }

    return [];
  }

  List<HiveModel> getHivesBasedInUserId(String userId) {
    List<HiveModel> hiveModels = getHives();
    return hiveModels.where((hiveModel) => hiveModel.userId == userId).toList();
  }
}
