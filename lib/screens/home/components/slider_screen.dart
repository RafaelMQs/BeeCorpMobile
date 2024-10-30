import 'package:bee_corp_app/screens/home/components/slider_full_screen.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  final List<Image> images;
  final List<Image> imagesFull;

  const SliderScreen(
      {super.key, required this.images, required this.imagesFull});

  @override
  State<SliderScreen> createState() => _SliderScreen();
}

class _SliderScreen extends State<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 240,
      child: CarouselView(
        itemExtent: MediaQuery.sizeOf(context).width - 100,
        itemSnapping: true,
        children: widget.images,
        onTap: (index) => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SliderFullScreen(
              imagesFull: widget.imagesFull,
              index: index,
            ),
          ),
        ),
      ),
    );
  }
}
