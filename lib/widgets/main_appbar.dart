import 'package:flutter/material.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppbar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        ],
      ),
      shadowColor: const Color.fromARGB(255, 224, 224, 224),
      elevation: 1,
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 16);

  
}