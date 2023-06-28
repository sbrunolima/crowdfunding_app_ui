import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Screens
import '../screens/home_page.dart';

class StartPage extends StatefulWidget {
  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _pageIndex = 0;

  final _screens = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_pageIndex],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: Colors.transparent,
              labelTextStyle: MaterialStateProperty.all(
                Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
              ),
            ),
            child: NavigationBar(
              height: 70,
              backgroundColor: Colors.white,
              selectedIndex: _pageIndex,
              onDestinationSelected: (i) => setState(() {
                _pageIndex = i;
              }),
              destinations: const [
                NavigationDestination(
                  selectedIcon: Icon(
                    EneftyIcons.home_2_outline,
                    color: Colors.green,
                    size: 26,
                  ),
                  icon: Icon(
                    EneftyIcons.home_2_outline,
                    color: Colors.grey,
                    size: 26,
                  ),
                  label: 'Home',
                ),
                NavigationDestination(
                  selectedIcon: Icon(
                    EneftyIcons.chart_6_outline,
                    color: Colors.green,
                    size: 26,
                  ),
                  icon: Icon(
                    EneftyIcons.chart_6_outline,
                    color: Colors.grey,
                    size: 26,
                  ),
                  label: 'Analytic',
                ),
                NavigationDestination(
                  selectedIcon: Icon(
                    EneftyIcons.scanner_outline,
                    color: Colors.green,
                    size: 26,
                  ),
                  icon: Icon(
                    EneftyIcons.scanner_outline,
                    color: Colors.grey,
                    size: 26,
                  ),
                  label: 'Qris',
                ),
                NavigationDestination(
                  selectedIcon: Icon(
                    EneftyIcons.slider_horizontal_outline,
                    color: Colors.green,
                    size: 26,
                  ),
                  icon: Icon(
                    EneftyIcons.slider_horizontal_outline,
                    color: Colors.grey,
                    size: 26,
                  ),
                  label: 'History',
                ),
                NavigationDestination(
                  selectedIcon: Icon(
                    EneftyIcons.profile_outline,
                    color: Colors.green,
                    size: 26,
                  ),
                  icon: Icon(
                    EneftyIcons.profile_outline,
                    color: Colors.grey,
                    size: 26,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
