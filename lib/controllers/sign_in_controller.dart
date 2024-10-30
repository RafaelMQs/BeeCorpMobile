import 'dart:convert';

import 'package:bee_corp_app/controllers/local_storage/local_storage.dart';
import 'package:bee_corp_app/controllers/sign_up_controller.dart';
import 'package:bee_corp_app/models/sign_in_model.dart';
import 'package:bee_corp_app/models/sign_up_model.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

const String LIST_OF_LOGGED_USER_KEY = 'LIST_OF_LOGGED_USER_KEY';

class SignInController {
  final SignUpController _signUpController = SignUpController();

  SignInController();

  SignUpModel? getLoginUser(String userEmail, String userPassword) {
    SignUpModel signUpModel = SignUpModel(
        const Uuid().v7(),
        'admin',
        'admin',
        'admin',
        'admin',
        'admin',
        'admin');
    _signUpController.saveSignUpUser(signUpModel);

    List<SignUpModel> signUpUsersModel = _signUpController.getSignUpUsers();

    SignUpModel? signUpUserModelFiltered = signUpUsersModel
        .where((signUpUser) =>
            userEmail == signUpUser.userEmail &&
            userPassword == signUpUser.userPassword)
        .firstOrNull;

    return signUpUserModelFiltered;
  }

  LocalStorageResult saveSignInUser(SignInModel signInModel) {
    removeSignInUsers();

    List<SignInModel> signInModelList = [signInModel];

    final String dateToBeSaved = jsonEncode(
        signInModelList.map((signInModel) => signInModel.toMap()).toList());

    final result = GetIt.I
        .get<LocalStorage>()
        .saveString(LIST_OF_LOGGED_USER_KEY, dateToBeSaved);

    return result;
  }

  SignInModel getSignInUser() {
    final result =
        GetIt.I.get<LocalStorage>().getString(LIST_OF_LOGGED_USER_KEY);

    if (result!.isNotEmpty) {
      final dateFromStorage = (jsonDecode(result) as List)
          .map<SignInModel>(
              (signInModelMap) => SignInModel.fromMap(signInModelMap))
          .firstOrNull;

      if (dateFromStorage == null) {
        throw Exception();
      }
      return dateFromStorage;
    }

    throw Exception();
  }

  LocalStorageResult removeSignInUsers() {
    final result =
        GetIt.I.get<LocalStorage>().removeData(LIST_OF_LOGGED_USER_KEY);

    return result;
  }
}
