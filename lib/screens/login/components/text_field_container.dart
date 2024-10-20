import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;

  const TextFieldContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: size.width * 0.85,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(29)),
      child: child,
    );
  }
}
