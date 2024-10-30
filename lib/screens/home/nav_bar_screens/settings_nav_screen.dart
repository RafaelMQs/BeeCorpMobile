import 'package:bee_corp_app/screens/home/components/default_nav_screen.dart';
import 'package:flutter/material.dart';

class SettingsNavScreen extends StatefulWidget {
  const SettingsNavScreen({super.key});

  @override
  State<SettingsNavScreen> createState() => _SettingsNavScreen();
}

class _SettingsNavScreen extends State<SettingsNavScreen> {
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
