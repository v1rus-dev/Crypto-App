import 'package:crypto_currency/features/account/account.dart';
import 'package:crypto_currency/features/crypto_all_list/view/view.dart';
import 'package:crypto_currency/features/crypto_list/view/view.dart';
import 'package:crypto_currency/features/news/view/view.dart';
import 'package:crypto_currency/utils/color_extensions.dart';
import 'package:crypto_currency/widgets/application_bottom_bar/application_bottom_bar.dart';
import 'package:crypto_currency/widgets/application_bottom_bar/application_bottom_bar_item.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ApplicationBottomBar(
        items: [
          ApplicationBottomBarItem(icon: Icon(Icons.home), title: Text('Home')),
          ApplicationBottomBarItem(icon: Icon(Icons.list), title: Text('List')),
          ApplicationBottomBarItem(
              icon: Icon(Icons.newspaper), title: Text("News")),
          ApplicationBottomBarItem(
              icon: Icon(Icons.person), title: Text("Profile"))
        ],
        selectedItemColor: HexColor.fromHex("0177FF"),
        unselectedItemColor: Colors.white,
        selectedContentColor: Colors.white,
        unselectedContentColor: const Color.fromRGBO(114, 114, 114, 100),
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          CryptoListScreen(),
          CryptoAllListScreen(),
          NewsScreen(),
          AccountScreen()
        ],
      ),
    );
  }
}
