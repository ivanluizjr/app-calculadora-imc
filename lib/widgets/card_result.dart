import 'package:flutter/material.dart';

class CardResult extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CardResult({required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget? cardChild;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: const EdgeInsets.only(right: 30, left: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colour,
      ),
    );
  }
}
