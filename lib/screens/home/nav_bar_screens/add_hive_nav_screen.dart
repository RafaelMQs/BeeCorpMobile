import 'package:bee_corp_app/controllers/local_storage/local_storage.dart';
import 'package:bee_corp_app/controllers/sign_up_controller.dart';
import 'package:bee_corp_app/models/sign_up_model.dart';
import 'package:bee_corp_app/screens/login/components/button_field.dart';
import 'package:bee_corp_app/screens/login/components/input_field.dart';
import 'package:bee_corp_app/screens/login/components/text_field_container.dart';
import 'package:flutter/material.dart';

class AddHiveNavScreen extends StatefulWidget {
  const AddHiveNavScreen({super.key});

  @override
  State<AddHiveNavScreen> createState() => _AddHiveNavScreen();
}

class _AddHiveNavScreen extends State<AddHiveNavScreen> {
  final _formKey = GlobalKey<FormState>();

  final SignUpController _signUpController = SignUpController();

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
            prefixIcon: const Icon(Icons.email),
            validator: (value) => value!.isEmpty
                ? "Por favor, digite o peso de sua colmeia"
                : null),
        InputField(
            inputController: _hiveStatus,
            keyboardType: TextInputType.text,
            labelText: 'Status',
            hintText: 'Digite o Status de sua Colmeia',
            prefixIcon: const Icon(Icons.email),
            validator: (value) => value!.isEmpty
                ? "Por favor, digite o status de sua colmeia"
                : null),
        TextFieldContainer(
          child: ButtonField(
            onPressed: () => (),
            child: const Text('Adicionar'),
          ),
        ),
      ],
    );
  }

  // void doRegister() {
  //   if (_formKey.currentState!.validate()) {
  //     SignUpModel signUpModel = SignUpModel(
  //         _userNameLogin.text,
  //         _userEmailLogin.text,
  //         _userPasswordLogin.text,
  //         _userPhoneLogin.text,
  //         _userZipCodeLogin.text,
  //         _userAddressLogin.text);

  //     final result = _signUpController.saveSignUpUser(signUpModel, context);

  //     if (result == LocalStorageResult.saved) {
  //       CommonUtils.showSnackBar(
  //           "Usuario salvo com sucesso!", Colors.green, context);
  //     } else if (result == LocalStorageResult.alreadyExists) {
  //       CommonUtils.showSnackBar("Email já existente!", Colors.orange, context);
  //     } else {
  //       CommonUtils.showSnackBar(
  //           "Houve um erro ao salvar o usuario!", Colors.red, context);
  //     }
  //   }
  // }
}
