import 'package:bee_corp_app/controllers/local_storage/local_storage.dart';
import 'package:bee_corp_app/controllers/sign_up_controller.dart';
import 'package:bee_corp_app/models/sign_up_model.dart';
import 'package:bee_corp_app/screens/login/components/button_field.dart';
import 'package:bee_corp_app/screens/login/components/input_field.dart';
import 'package:bee_corp_app/screens/login/components/password_input_field.dart';
import 'package:bee_corp_app/screens/login/components/text_field_container.dart';
import 'package:bee_corp_app/screens/utils/common_utils.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.title});

  final String title;

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final SignUpController _signUpController = SignUpController();

  final TextEditingController _userNameLogin = TextEditingController();
  final TextEditingController _userEmailLogin = TextEditingController();
  final TextEditingController _userPasswordLogin = TextEditingController();
  final TextEditingController _userPhoneLogin = TextEditingController();
  final TextEditingController _userZipCodeLogin = TextEditingController();
  final TextEditingController _userAddressLogin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Cadastrar',
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
            inputController: _userNameLogin,
            keyboardType: TextInputType.emailAddress,
            labelText: 'Nome',
            hintText: 'Digite o seu Nome',
            prefixIcon: const Icon(Icons.people),
            validator: (value) =>
                value!.isEmpty ? "Por favor, digite o seu nome" : null),
        InputField(
            inputController: _userEmailLogin,
            keyboardType: TextInputType.emailAddress,
            labelText: 'Email',
            hintText: 'Digite o seu Email',
            prefixIcon: const Icon(Icons.email),
            validator: (value) =>
                value!.isEmpty ? "Por favor, digite o seu email" : null),
        PasswordInputField(
            inputController: _userPasswordLogin,
            validator: (value) =>
                value!.isEmpty ? "Por favor, digite a sua senha" : null),
        InputField(
            inputController: _userPhoneLogin,
            keyboardType: TextInputType.emailAddress,
            labelText: 'Telefone',
            hintText: 'Digite o seu Telefone',
            prefixIcon: const Icon(Icons.phone),
            validator: (value) =>
                value!.isEmpty ? "Por favor, digite o seu telefone" : null),
        InputField(
            inputController: _userZipCodeLogin,
            keyboardType: TextInputType.emailAddress,
            labelText: 'Cep',
            hintText: 'Digite o seu CEP',
            prefixIcon: const Icon(Icons.map_sharp),
            validator: (value) =>
                value!.isEmpty ? "Por favor, digite o seu cep" : null),
        InputField(
            inputController: _userAddressLogin,
            keyboardType: TextInputType.emailAddress,
            labelText: 'Endereço',
            hintText: 'Digite o seu Endereço',
            prefixIcon: const Icon(Icons.home),
            validator: (value) =>
                value!.isEmpty ? "Por favor, digite o seu endereço" : null),
        TextFieldContainer(
          child: ButtonField(
            onPressed: () => doRegister(),
            child: const Text('Cadastrar'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Já possui uma conta cadastrada? "),
            GestureDetector(
              child: const Text(
                "Entrar",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () => Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterScreen(
                    title: "RegisterScreen",
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  void doRegister() {
    if (_formKey.currentState!.validate()) {
      SignUpModel signUpModel = SignUpModel(
          _userNameLogin.text,
          _userEmailLogin.text,
          _userPasswordLogin.text,
          _userPhoneLogin.text,
          _userZipCodeLogin.text,
          _userAddressLogin.text);

      final result = _signUpController.saveSignUpUser(signUpModel, context);

      if (result == LocalStorageResult.saved) {
        CommonUtils.showSnackBar(
            "Usuario salvo com sucesso!", Colors.green, context);
      } else if (result == LocalStorageResult.alreadyExists) {
        CommonUtils.showSnackBar("Email já existente!", Colors.orange, context);
      } else {
        CommonUtils.showSnackBar(
            "Houve um erro ao salvar o usuario!", Colors.red, context);
      }
    }
  }
}
