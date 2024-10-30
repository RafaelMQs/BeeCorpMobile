import 'package:flutter/material.dart';

class DefaultNavScreen extends StatefulWidget {
  final String title;
  final Widget body;

  const DefaultNavScreen({super.key, required this.title, required this.body});

  @override
  State<DefaultNavScreen> createState() => _DefaultNavScreen();
}

class _DefaultNavScreen extends State<DefaultNavScreen> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(widget.title),
        ),
        backgroundColor: colorScheme.inversePrimary,
        shadowColor: colorScheme.shadow,
        elevation: 1,
      ),
      body: widget.body,
    );
  }
}
