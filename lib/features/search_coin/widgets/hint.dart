import 'package:flutter/material.dart';

class Hint extends StatelessWidget {
  Hint({super.key, required this.hintText, this.onTap});

  final String hintText;
  void Function(String)? onTap;

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () {
            onTap?.call(hintText);
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: Center(child: Text(hintText)),
          ),
        ),
      );
}
