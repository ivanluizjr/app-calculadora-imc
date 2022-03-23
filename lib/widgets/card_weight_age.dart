import 'package:flutter/material.dart';

class CardWightAge extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CardWightAge({
    required this.colour,
    required this.cardChild,
  });

  final Color colour;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colour,
      ),
    );
  }
}
