import 'package:flutter/material.dart';

class AddHiveNavScreen extends StatefulWidget {
  const AddHiveNavScreen({super.key});

  @override
  State<AddHiveNavScreen> createState() => _AddHiveNavScreen();
}

class _AddHiveNavScreen extends State<AddHiveNavScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("ADD HIVE"),
    ));
  }
}
