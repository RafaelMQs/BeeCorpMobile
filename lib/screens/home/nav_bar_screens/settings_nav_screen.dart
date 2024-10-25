import 'package:flutter/material.dart';

class SettingsNavScreen extends StatefulWidget {
  const SettingsNavScreen({super.key});

  @override
  State<SettingsNavScreen> createState() => _SettingsNavScreen();
}

class _SettingsNavScreen extends State<SettingsNavScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("SETTINGS"),
    ));
  }
}
