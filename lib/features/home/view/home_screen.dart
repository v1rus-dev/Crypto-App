import 'package:crypto_currency/features/account/account.dart';
import 'package:crypto_currency/features/crypto_all_list/view/view.dart';
import 'package:crypto_currency/features/crypto_list/view/view.dart';
import 'package:crypto_currency/features/news/view/view.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    CryptoListScreen(),
    CryptoAllListScreen(),
    NewsScreen(),
    AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        items: [
          SalomonBottomBarItem(icon: Icon(Icons.home), title: Text('Home'), selectedColor: Colors.blue),
          SalomonBottomBarItem(icon: Icon(Icons.list), title: Text('List'), selectedColor: Colors.purple),
          SalomonBottomBarItem(icon: Icon(Icons.newspaper), title: Text("News"), selectedColor: Colors.cyan),
          SalomonBottomBarItem(icon: Icon(Icons.person), title: Text("Profile"), selectedColor: Colors.green[700])
        ],
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
      ),
      body: _pages[_selectedIndex],
    );
  }
}
