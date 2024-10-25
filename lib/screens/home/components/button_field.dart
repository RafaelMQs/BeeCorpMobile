import 'package:flutter/material.dart';

class ButtonField extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;

  const ButtonField({super.key, required this.onPressed, required this.child});

  @override
  State<ButtonField> createState() => _ButtonField();
}

class _ButtonField extends State<ButtonField> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return MaterialButton(
      minWidth: double.infinity,
      height: 40,
      onPressed: widget.onPressed,
      color: colorScheme.inversePrimary,
      child: widget.child,
    );
  }
}
