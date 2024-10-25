import 'package:bee_corp_app/controllers/sign_up_controller.dart';
import 'package:bee_corp_app/models/sign_up_model.dart';
import 'package:flutter/material.dart';

class SignInController {
  final SignUpController _signUpController;

  SignInController(this._signUpController);

  bool checkLogin(String userEmail, String userPassword) {
    List<SignUpModel> signUpUsersModel = _signUpController.getSignUpUsers();

    SignUpModel? signUpUserModelFiltered = signUpUsersModel
        .where((signUpUser) =>
            userEmail == signUpUser.userEmail &&
            userPassword == signUpUser.userPassword)
        .firstOrNull;

    return signUpUserModelFiltered != null;
  }
}
