import 'package:flutter/material.dart';

class AddHiveNavScreen extends StatefulWidget {
  const AddHiveNavScreen({super.key});

  @override
  State<AddHiveNavScreen> createState() => _AddHiveNavScreen();
}

class _AddHiveNavScreen extends State<AddHiveNavScreen> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home Hive'),
        backgroundColor: colorScheme.inversePrimary,
        shadowColor: colorScheme.shadow,
      ),
      body: const Center(
        child: Text("Home Hive"),
      ),
    );
  }
}
