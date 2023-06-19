import 'package:ShopSM/views/home/tabs/account_screen.dart';
import 'package:ShopSM/widgets/bottom_drawer.dart';
import 'package:ShopSM/views/home/tabs/cards_screen.dart';
import 'package:ShopSM/views/home/tabs/discover_screen.dart';
import 'package:ShopSM/views/home/tabs/inbox_screen.dart';
import 'package:ShopSM/views/home/tabs/services_screen.dart';
import 'package:flutter/material.dart';
import 'package:ShopSM/widgets/app_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPageIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ServicesScreen(),
    DiscoverScreen(),
    CardsScreen(),
    AccountScreen(),
    InboxScreen(),
  ];

  void onSelectedPageIndex(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white24,
        toolbarHeight: 140,
        flexibleSpace: const AppHeader(title: 'SHOPSM'),
      ),
      body: _widgetOptions.elementAt(selectedPageIndex),
      bottomNavigationBar: const BottomDrawer(),
    );
  }
}