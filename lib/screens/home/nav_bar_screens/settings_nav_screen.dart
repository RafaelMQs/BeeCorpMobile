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

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Settings'),
        backgroundColor: colorScheme.inversePrimary,
        shadowColor: colorScheme.shadow,
        elevation: 1,
      ),
      body: const Center(
        child: Text("Settings"),
      ),
    );
  }
}
