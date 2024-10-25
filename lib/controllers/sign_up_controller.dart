import 'dart:convert';
import 'dart:developer';
import 'package:bee_corp_app/controllers/local_storage/local_storage.dart';
import 'package:bee_corp_app/models/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

// ignore: constant_identifier_names
const String LIST_OF_USERS_KEY = 'LIST_OF_USERS_KEY';

class SignUpController {
  LocalStorageResult saveSignUpUser(
      SignUpModel signUpModel, BuildContext context) {
    if (getSignUpUsers()
        .any((value) => value.userEmail == signUpModel.userEmail)) {
      return LocalStorageResult.alreadyExists;
    }

    List<SignUpModel> signUpModelList = [...getSignUpUsers(), signUpModel];

    final String dateToBeSaved = jsonEncode(
        signUpModelList.map((signUpModel) => signUpModel.toMap()).toList());

    final result = GetIt.I
        .get<LocalStorage>()
        .saveString(LIST_OF_USERS_KEY, dateToBeSaved);

    return result;
  }

  List<SignUpModel> getSignUpUsers() {
    final result = GetIt.I.get<LocalStorage>().getString(LIST_OF_USERS_KEY);

    if (result!.isNotEmpty) {
      final dateFromStorage = (jsonDecode(result) as List)
          .map<SignUpModel>(
              (signUpModelMap) => SignUpModel.fromMap(signUpModelMap))
          .toList();

      return dateFromStorage.toList();
    }

    return [];
  }
}
