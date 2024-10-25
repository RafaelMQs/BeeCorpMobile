import 'package:bee_corp_app/controllers/sign_in_controller.dart';
import 'package:bee_corp_app/controllers/sign_up_controller.dart';
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

  final SignUpController _signUpController = SignUpController();

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
      bool isLoginValid = SignInController(_signUpController)
          .checkLogin(_userEmailLogin.text, _userPasswordLogin.text);

      if (isLoginValid) {
        CommonUtils.showSnackBar(
            "Usuario logado com sucesso!", Colors.green, context);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        CommonUtils.showSnackBar("Login Invalido", Colors.red, context);
      }
    }
  }
}
