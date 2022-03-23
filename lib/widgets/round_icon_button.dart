import 'dart:async';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    Timer? _timer;

    return Material(
      color: Colors.red,
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTapDown: (details) {
          _timer = Timer.periodic(
            const Duration(milliseconds: 200),
            (_timer) {
              onPressed();
            },
          );
        },
        onTap: () {
          _timer?.cancel();
        },
        child: Container(
          decoration: const ShapeDecoration(
            shape: CircleBorder(),
          ),
          child: Icon(icon),
          padding: const EdgeInsets.all(16.0),
        ),
      ),
    );

    /*return MaterialButton(
      child: Icon(icon),
      onPressed: () {},
      elevation: 6.0,
      shape: const CircleBorder(),
      color: const Color(0xFF4C4F5E),
      minWidth: 56.0,
      height: 56.0,
    );*/
  }
}
