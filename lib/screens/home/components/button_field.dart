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
    return MaterialButton(
      minWidth: double.infinity,
      height: 40,
      onPressed: widget.onPressed,
      color: Theme.of(context).colorScheme.inversePrimary,
      child: widget.child,
    );
  }
}
