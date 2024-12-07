import 'package:flutter/material.dart';

class IconButtonWrapper extends StatelessWidget {
  const IconButtonWrapper({super.key, required this.icon, required this.onPressed});

  final Widget icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(splashRadius: 24, onPressed: onPressed, icon: icon);
  }
}
