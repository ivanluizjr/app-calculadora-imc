import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/constants.dart';

class ButtonAddRemove extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ButtonAddRemove({required this.icon, required this.onPressed, Key? key})
      : super(key: key);

  final void Function() onPressed;
  final IconData icon;

  @override
  State<ButtonAddRemove> createState() => _ButtonAddRemoveState();
}

class _ButtonAddRemoveState extends State<ButtonAddRemove> {
  late Timer timer;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: kBottomColorAddRemove,
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTapDown: (details) {
          timer = Timer.periodic(
            const Duration(milliseconds: 200),
            (timer) {
              widget.onPressed();
            },
          );
        },
        onTap: () => timer.cancel(),
        child: Container(
          decoration: const ShapeDecoration(
            shape: CircleBorder(),
          ),
          child: Icon(widget.icon),
          padding: const EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}
