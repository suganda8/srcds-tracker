/*
MIT License

Copyright (c) 2023 Tegar Bangun Suganda (OVERMIND)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:srcds_tracker/src/components/shrink_and_grow_bottom_navigation_bar.dart';
import 'package:srcds_tracker/src/ui/home.dart';
import 'package:srcds_tracker/src/ui/settings.dart';
import 'package:srcds_tracker/src/utils/colors_utility.dart';
import 'package:srcds_tracker/src/utils/styles.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

int _crntBtmNavIndex = 0;

void main() {
  runApp(const SRCDSTracker());
}

class SRCDSTracker extends StatelessWidget {
  const SRCDSTracker({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.black.withOpacity(0.3),
        systemNavigationBarColor: ColorsUtility.uiDark,
      ),
    );

    return MaterialApp(
      title: 'SRCDS Tracker',
      debugShowCheckedModeBanner: false,
      theme: getLightTheme(context),
      darkTheme: getDarkTheme(context),
      themeMode: ThemeMode.dark,
      navigatorKey: navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (_) => const Main(),
            );
          case '/settings':
            return MaterialPageRoute(
              builder: (_) => const SettingsPage(),
            );
          default:
            return null;
        }
      },
      home: const Main(),
    );
  }
}

ScrollController homeScrollController = ScrollController();

List<ScrollController?> _scrollControllers = [
  homeScrollController,
  null,
];

List<Widget> _pages = [
  HomePage(scrollController: homeScrollController),
  const SettingsPage(),
];

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          IndexedStack(
            index: _crntBtmNavIndex,
            children: _pages,
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: (MediaQuery.of(context).viewInsets.bottom == 0.0)
                    ? MediaQuery.of(context).padding.bottom
                    : MediaQuery.of(context).viewInsets.bottom),
            child: buildCustomBtmNavbar(),
          ),
        ],
      ),
    );
  }

  Widget buildCustomBtmNavbar() {
    return ShrinkAndGrowBottomNavigationBar(
      currentIndex: _crntBtmNavIndex,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? ColorsUtility.uiDark
          : const Color.fromARGB(255, 240, 240, 240),
      elevation: 0.0,
      items: [
        ShrinkAndGrowBottomNavigationItem(icon: const Icon(Icons.home_filled), label: 'Home'),
        ShrinkAndGrowBottomNavigationItem(icon: const Icon(Icons.settings), label: 'Settings'),
      ],
      selectedItemColor:
          Theme.of(context).brightness == Brightness.dark ? Colors.white : ColorsUtility.royalBlue,
      scrollControllers: _scrollControllers,
      onTap: (index) {
        setState(() {
          _crntBtmNavIndex = index;
        });
      },
    );
  }
}
