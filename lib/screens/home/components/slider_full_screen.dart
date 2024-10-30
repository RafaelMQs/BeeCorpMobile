import 'package:flutter/material.dart';

class SliderFullScreen extends StatefulWidget {
  final List<Image> imagesFull;
  final int index;

  const SliderFullScreen(
      {super.key, required this.imagesFull, required this.index});

  @override
  State<SliderFullScreen> createState() => _SliderFullScreen();
}

class _SliderFullScreen extends State<SliderFullScreen> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBody: true,
      body: Center(
        child: InteractiveViewer(
          maxScale: 10.0,
          minScale: 0.01,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: widget.imagesFull[widget.index],
          ),
        ),
      ),
    );
  }
}
