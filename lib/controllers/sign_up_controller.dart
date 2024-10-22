import 'package:bee_corp_app/controllers/sign_up_storage_controller.dart';
import 'package:bee_corp_app/models/sign_up_model.dart';
import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const String LIST_OF_USERS_KEY = 'LIST_OF_USERS_KEY';

class SignUpController {
  final SignUpStorageController _storageController;

  SignUpController(this._storageController);

  final ValueNotifier<List<SignUpModel>> signUpModels = ValueNotifier([]);

  void setSignUpModels(SignUpModel signUpModel) {
    signUpModels.value = [...signUpModels.value, signUpModel];
  }

  Future<void> saveSignUpUser(BuildContext context) async {
    await _storageController.signUpUser(signUpModels.value);

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Usuario salvo com sucesso!"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  Future<void> getSignUpUsers() async {
    signUpModels.value = await _storageController.getSignUpUsers();
  }

  Future<void> deleteAllSignUpUsers(BuildContext context) async {
    await _storageController.deleteAllSignUpUsers();

    signUpModels.value = [];

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Usuarios limpos com sucesso!")),
      );
    }
  }
}
