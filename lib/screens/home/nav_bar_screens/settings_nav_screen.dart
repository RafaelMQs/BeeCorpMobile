import 'package:bee_corp_app/controllers/sign_in_controller.dart';
import 'package:bee_corp_app/screens/home/components/default_nav_screen.dart';
import 'package:bee_corp_app/screens/login/login_screen.dart';
import 'package:bee_corp_app/screens/utils/common_utils.dart';
import 'package:flutter/material.dart';

class SettingsNavScreen extends StatefulWidget {
  const SettingsNavScreen({super.key});

  @override
  State<SettingsNavScreen> createState() => _SettingsNavScreen();
}

class _SettingsNavScreen extends State<SettingsNavScreen> {
  final SignInController _signInController = SignInController();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return const DefaultNavScreen(
      title: 'Settings',
      body: Center(
        child: Text("Settings"),
      ),
    );
  }
}
