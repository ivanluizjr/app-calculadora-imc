import 'package:flutter/material.dart';

class CardIcons extends StatelessWidget {
  const CardIcons({required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget? cardChild;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress as void Function()?,
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(3),
        //height: 200,
        //width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
      ),
    );
  }
}
