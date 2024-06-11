import 'package:education_app/constants/color.dart';
import 'package:education_app/constants/size.dart';
import 'package:education_app/screens/featuerd_screen.dart';
import 'package:education_app/screens/categories_screen.dart';
import 'package:education_app/screens/bookmark_screen.dart';
import 'package:education_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    FeaturedScreen(),
    CategoriesScreen(),
    BookmarkScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kPrimaryColor,
          backgroundColor: Colors.white,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/icons/home.png',
                height: kBottomNavigationBarItemSize,
              ),
              icon: Image.asset(
                'assets/icons/home_outlined.png',
                height: kBottomNavigationBarItemSize,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/icons/categories.png',
                height: kBottomNavigationBarItemSize,
              ),
              icon: Image.asset(
                'assets/icons/categories_outlined.png',
                height: kBottomNavigationBarItemSize,
              ),
              label: "Category",
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/icons/bookmark.png',
                height: kBottomNavigationBarItemSize,
              ),
              icon: Image.asset(
                'assets/icons/bookmark_outlined.png',
                height: kBottomNavigationBarItemSize,
              ),
              label: "Bookmark",
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/icons/profile.png',
                height: kBottomNavigationBarItemSize,
              ),
              icon: Image.asset(
                'assets/icons/profile_outlined.png',
                height: kBottomNavigationBarItemSize,
              ),
              label: "Profile",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}
