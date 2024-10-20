import 'package:bee_corp_app/screens/login/components/button_field.dart';
import 'package:bee_corp_app/screens/login/components/input_field.dart';
import 'package:bee_corp_app/screens/login/components/password_input_field.dart';
import 'package:bee_corp_app/screens/login/components/text_field_container.dart';
import 'package:bee_corp_app/screens/login/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  InputField(
                      keyboardType: TextInputType.emailAddress,
                      labelText: 'Email',
                      hintText: 'Digite o seu Email',
                      prefixIcon: const Icon(Icons.email),
                      validator: (value) => value!.isEmpty
                          ? "Por favor, digite o seu email"
                          : null),
                  PasswordInputField(
                      validator: (value) => value!.isEmpty
                          ? "Por favor, digite a sua senha"
                          : null),
                  TextFieldContainer(
                    child: ButtonField(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Processing Data'),
                            ),
                          );
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Não possui uma conta cadastrada? "),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(
                              title: "RegisterScreen",
                            ),
                          ),
                        ),
                        child: const Text(
                          "Cadastre-se",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
