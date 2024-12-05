import 'package:flutter/material.dart';

class ApplicationBottomBarItem {
  final Widget icon;

  final Widget? activeIcon;

  final Widget title;

  final Color? selectedColor;

  final Color? unselectedColor;

  ApplicationBottomBarItem({
    required this.icon,
    required this.title,
    this.activeIcon,
    this.selectedColor,
    this.unselectedColor
  });
}