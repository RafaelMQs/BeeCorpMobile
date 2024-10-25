import 'package:flutter/material.dart';

class HomeNavScreen extends StatefulWidget {
  const HomeNavScreen({super.key});

  @override
  State<HomeNavScreen> createState() => _HomeNavScreen();
}

class _HomeNavScreen extends State<HomeNavScreen> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
        backgroundColor: colorScheme.inversePrimary,
        shadowColor: colorScheme.shadow,
      ),
      body: const Center(
        child: Text("Home"),
      ),
    );
  }
}
