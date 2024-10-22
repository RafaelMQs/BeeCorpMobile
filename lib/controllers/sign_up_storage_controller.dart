import 'dart:convert';

import 'package:bee_corp_app/models/sign_up_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: constant_identifier_names
const String LIST_OF_USERS_KEY = 'LIST_OF_USERS_KEY';

class SignUpStorageController {
  Future<void> signUpUser(List<SignUpModel> signUpModelList) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    final dateToBeSaved = jsonEncode(
        signUpModelList.map((signUpModel) => signUpModel.toMap()).toList());

    await preferences.setString(LIST_OF_USERS_KEY, dateToBeSaved);
  }

  Future<List<SignUpModel>> getSignUpUsers() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    final String? resultListString = preferences.getString(LIST_OF_USERS_KEY);

    if (resultListString != null) {
      final dateFromStorage = (jsonDecode(resultListString) as List)
          .map<SignUpModel>(
              (signUpModelMap) => SignUpModel.fromMap(signUpModelMap))
          .toList();

      return dateFromStorage;
    }

    return [];
  }

  Future<void> deleteAllSignUpUsers() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(LIST_OF_USERS_KEY);
  }
}
