import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallbunch/constants.dart';
import 'package:wallbunch/views/homepage.dart';
import 'package:wallbunch/views/searchpage.dart';

int bottomSelectedIndex = 0;

List<BottomNavigationBarItem> buildBottomNavBarItems() {
  return [
    BottomNavigationBarItem(icon: new Icon(Icons.home_rounded), label: 'Home'),
    BottomNavigationBarItem(
      icon: new Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
  ];
}

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  void initState() {
    super.initState();
  }

  /*@override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }*/
  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      Constant.screensPageViewController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 0,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: PageView(
                allowImplicitScrolling: true,
                physics: NeverScrollableScrollPhysics(),
                controller: Constant.screensPageViewController,
                onPageChanged: (index) {
                  setState(() {
                    bottomSelectedIndex = index;
                  });
                },
                children: [HomePage(), DiscoverPage()],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          unselectedLabelStyle: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconSize: 20,
          elevation: 20,
          selectedIconTheme: IconThemeData(size: 30),
          currentIndex: bottomSelectedIndex,
          items: buildBottomNavBarItems(),
          onTap: (index) {
            Constant.screensPageViewController.animateToPage(index,
                duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
          },
        ),
      ),
    );
  }
}
