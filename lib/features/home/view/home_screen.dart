import 'package:auto_route/auto_route.dart';
import 'package:crypto_currency/router/router.gr.dart';
import 'package:crypto_currency/utils/color_extensions.dart';
import 'package:crypto_currency/widgets/application_bottom_bar/application_bottom_bar.dart';
import 'package:crypto_currency/widgets/application_bottom_bar/application_bottom_bar_item.dart';
import 'package:flutter/material.dart';

@RoutePage()
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
    return AutoTabsRouter(
      routes: const [
        CryptoListRoute(),
        AllListCoinsRoute(),
        NewsRoute(),
        AccountRoute()
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: ApplicationBottomBar(
            items: [
              ApplicationBottomBarItem(
                  icon: Icon(Icons.home), title: Text('Home')),
              ApplicationBottomBarItem(
                  icon: Icon(Icons.list), title: Text('List')),
              ApplicationBottomBarItem(
                  icon: Icon(Icons.newspaper), title: Text("News")),
              ApplicationBottomBarItem(
                  icon: Icon(Icons.person), title: Text("Profile"))
            ],
            selectedItemColor: HexColor.fromHex("0177FF"),
            unselectedItemColor: Colors.white,
            selectedContentColor: Colors.white,
            unselectedContentColor: const Color.fromRGBO(114, 114, 114, 100),
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
          ),
        );
      },
    );
  }
}
