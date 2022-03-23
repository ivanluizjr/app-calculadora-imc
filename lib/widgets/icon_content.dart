import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData? icon;
  final String? label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 100.0,
          color: color,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          label!,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
