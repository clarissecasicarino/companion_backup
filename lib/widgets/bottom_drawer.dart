import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class BottomDrawer extends StatefulWidget {
  const BottomDrawer({Key? key}) : super(key: key);

  @override
  State<BottomDrawer> createState() => _BottomDrawerState();
}

class _BottomDrawerState extends State<BottomDrawer> {
  int selectedPageIndex = 0;

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
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30.0),
          topLeft: Radius.circular(30.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30.0),
          topLeft: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              label: "Services",
              icon: Padding(
                padding: EdgeInsets.only(top: 6),
                child: Column(
                  children: [
                    HeroIcon(HeroIcons.squaresPlus),
                    SizedBox(height: 4),
                  ],
                ),
              ),
            ),
            const BottomNavigationBarItem(
              label: "Discover",
              icon: Padding(
                padding: EdgeInsets.only(top: 6),
                child: Column(
                  children: [
                    HeroIcon(HeroIcons.newspaper),
                    SizedBox(height: 4),
                  ],
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "Cards",
              icon: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF0030FF),
                          ),
                        ),
                        const HeroIcon(HeroIcons.creditCard,
                            color: Colors.white, size: 20),
                      ],
                    ),
                    const SizedBox(height: 6),
                  ],
                ),
              ),
            ),
            const BottomNavigationBarItem(
              label: "My SM",
              icon: Padding(
                padding: EdgeInsets.only(top: 6),
                child: Column(
                  children: [
                    HeroIcon(HeroIcons.userCircle),
                    SizedBox(height: 4),
                  ],
                ),
              ),
            ),
            const BottomNavigationBarItem(
              label: "Inbox",
              icon: Padding(
                padding: EdgeInsets.only(top: 6),
                child: Column(
                  children: [
                    HeroIcon(HeroIcons.bell),
                    SizedBox(height: 4),
                  ],
                ),
              ),
            ),
          ],
          onTap: onSelectedPageIndex,
          currentIndex: selectedPageIndex,
          selectedIconTheme: const IconThemeData(
            color: Color(0xFF0030FF),
          ),
          selectedItemColor: const Color(0xFF0030FF),
          selectedFontSize: 12.0,
          unselectedLabelStyle: const TextStyle(fontFamily: 'HenrySans'),
          selectedLabelStyle: const TextStyle(fontFamily: 'HenrySans'),
        ),
      ),
    );
  }
}
