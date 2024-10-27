import 'package:bee_corp_app/controllers/local_storage/local_storage.dart';
import 'package:bee_corp_app/controllers/sign_in_controller.dart';
import 'package:bee_corp_app/models/sign_in_model.dart';
import 'package:bee_corp_app/models/sign_up_model.dart';
import 'package:bee_corp_app/screens/home/home_screen.dart';
import 'package:bee_corp_app/screens/login/components/button_field.dart';
import 'package:bee_corp_app/screens/login/components/input_field.dart';
import 'package:bee_corp_app/screens/login/components/password_input_field.dart';
import 'package:bee_corp_app/screens/login/components/text_field_container.dart';
import 'package:bee_corp_app/screens/login/register_screen.dart';
import 'package:bee_corp_app/screens/utils/common_utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final SignInController _signInController = SignInController();
  final TextEditingController _userEmailLogin = TextEditingController();
  final TextEditingController _userPasswordLogin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Login',
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
        TextFieldContainer(
          child: ButtonField(
            onPressed: () => doLogin(),
            child: const Text('Entrar'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Não possui uma conta cadastrada? "),
            GestureDetector(
              child: const Text(
                "Cadastre-se",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () => Navigator.push(
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

  void doLogin() {
    if (_formKey.currentState!.validate()) {
      SignUpModel? loginUser = _signInController.getLoginUser(
          _userEmailLogin.text, _userPasswordLogin.text);

      if (loginUser != null) {
        SignInModel signInModel = SignInModel(
            loginUser.userId,
            loginUser.userName,
            loginUser.userEmail,
            loginUser.userPhone,
            loginUser.userZipCode,
            loginUser.userAddress);

        LocalStorageResult result =
            _signInController.saveSignInUser(signInModel);

        if (result != LocalStorageResult.failed) {
          CommonUtils.showSnackBar(
              "Usuario logado com sucesso!", Colors.green, context);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else {
          CommonUtils.showSnackBar(
              "Houve um erro no login, tente novamente mais tarde",
              Colors.red,
              context);
        }
      } else {
        CommonUtils.showSnackBar("Login Invalido", Colors.red, context);
      }
    }
  }
}
