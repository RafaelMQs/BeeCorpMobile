import 'package:bee_corp_app/controllers/sign_up_controller.dart';
import 'package:bee_corp_app/models/sign_up_model.dart';
import 'package:flutter/material.dart';

class SignInController {
  final SignUpController _signUpController;

  SignInController(this._signUpController);

  bool checkLogin(String userEmail, String userPassword, BuildContext context) {
    _signUpController.getSignUpUsers();
    List<SignUpModel> signUpUsersModel = _signUpController.signUpModels.value;

    SignUpModel? signUpUserModelFiltered = signUpUsersModel
        .where((signUpUser) =>
            userEmail == signUpUser.userEmail &&
            userPassword == signUpUser.userPassword)
        .firstOrNull;

    if (context.mounted) {
      if (signUpUserModelFiltered != null) {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
                content: Text("Usuario logado com sucesso!"),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 1)),
          );

        return true;
      } else {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text("Login invalido!"),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 1),
            ),
          );

        return false;
      }
    }

    return false;
  }
}
