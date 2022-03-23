import 'package:flutter/material.dart';

class CardSlider extends StatelessWidget {
  const CardSlider({required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget? cardChild;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: const EdgeInsets.all(3),
      //height: 200,
      //width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colour,
      ),
    );
  }
}
