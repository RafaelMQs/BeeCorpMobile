import 'dart:developer';

import 'package:bee_corp_app/controllers/hive_controller.dart';
import 'package:bee_corp_app/controllers/local_storage/local_storage.dart';
import 'package:bee_corp_app/controllers/sign_in_controller.dart';
import 'package:bee_corp_app/models/hive_model.dart';
import 'package:bee_corp_app/models/sign_in_model.dart';
import 'package:bee_corp_app/screens/login/components/button_field.dart';
import 'package:bee_corp_app/screens/login/components/input_field.dart';
import 'package:bee_corp_app/screens/login/components/text_field_container.dart';
import 'package:bee_corp_app/screens/login/login_screen.dart';
import 'package:bee_corp_app/screens/utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AddHiveNavScreen extends StatefulWidget {
  const AddHiveNavScreen({super.key});

  @override
  State<AddHiveNavScreen> createState() => _AddHiveNavScreen();
}

class _AddHiveNavScreen extends State<AddHiveNavScreen> {
  final _formKey = GlobalKey<FormState>();

  final SignInController _signInController = SignInController();
  final HiveController _hiveController = HiveController();

  final TextEditingController _hiveCode = TextEditingController();
  final TextEditingController _hiveWeight = TextEditingController();
  final TextEditingController _hiveStatus = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Adicionar Colmeia'),
        backgroundColor: colorScheme.inversePrimary,
        shadowColor: colorScheme.shadow,
        elevation: 1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Adicione um registro',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Form(key: _formKey, child: buildInputs()),
          ],
        ),
      ),
    );
  }

  Widget buildInputs() {
    return Column(
      children: [
        InputField(
            inputController: _hiveCode,
            keyboardType: TextInputType.emailAddress,
            labelText: 'Código',
            hintText: 'Digite o código de sua colmeia',
            prefixIcon: const Icon(Icons.code),
            validator: (value) => value!.isEmpty
                ? "Por favor, digite o código de sua colmeia"
                : null),
        InputField(
            inputController: _hiveWeight,
            keyboardType: TextInputType.number,
            labelText: 'Peso',
            hintText: 'Digite o Peso de sua Colmeia',
            prefixIcon: const Icon(Icons.line_weight),
            validator: (value) => value!.isEmpty
                ? "Por favor, digite o peso de sua colmeia"
                : null),
        InputField(
            inputController: _hiveStatus,
            keyboardType: TextInputType.text,
            labelText: 'Status',
            hintText: 'Digite o Status de sua Colmeia',
            prefixIcon: const Icon(Icons.message),
            validator: (value) => value!.isEmpty
                ? "Por favor, digite o status de sua colmeia"
                : null),
        TextFieldContainer(
          child: ButtonField(
            onPressed: () => registerHive(),
            child: const Text('Adicionar'),
          ),
        ),
      ],
    );
  }

  void registerHive() {
    if (_formKey.currentState!.validate()) {
      SignInModel? loginUser = _signInController.getSignInUser();
      if (loginUser != null) {
        HiveModel hiveModel = HiveModel(
          const Uuid().v7(),
          loginUser.userId,
          _hiveCode.text,
          _hiveWeight.text,
          _hiveStatus.text,
        );

        LocalStorageResult result = _hiveController.saveHive(hiveModel);

        if (result != LocalStorageResult.failed) {
          CommonUtils.showSnackBar(
              "Registro salvo com sucesso!", Colors.green, context);
        } else {
          CommonUtils.showSnackBar(
              "Houve um erro ao salvar seu registro, tente novamente mais tarde",
              Colors.red,
              context);
        }
      } else {
        CommonUtils.showSnackBar(
            "Houve um erro com sua sessão. Entre novamente!",
            Colors.red,
            context);

        Navigator.pushAndRemoveUntil<void>(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => const LoginScreen()),
          ModalRoute.withName('/'),
        );
      }
    }
  }
}
