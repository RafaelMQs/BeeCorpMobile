import 'package:bee_corp_app/controllers/sign_in_controller.dart';
import 'package:bee_corp_app/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class DefaultNavScreen extends StatefulWidget {
  final String title;
  final Widget body;

  const DefaultNavScreen({super.key, required this.title, required this.body});

  @override
  State<DefaultNavScreen> createState() => _DefaultNavScreen();
}

class _DefaultNavScreen extends State<DefaultNavScreen> {
  final SignInController _signInController = SignInController();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(widget.title),
            const Expanded(child: SizedBox()),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
              ),
              child: const Icon(Icons.logout),
              onPressed: () {
                _signInController.removeSignInUsers();
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
        backgroundColor: colorScheme.inversePrimary,
        shadowColor: colorScheme.shadow,
        elevation: 1,
      ),
      body: widget.body,
    );
  }
}
