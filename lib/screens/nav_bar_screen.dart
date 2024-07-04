import 'package:app_shop_dien_tu/screens/Cart/cart_screen.dart';
import 'package:app_shop_dien_tu/screens/Home/home_screen.dart';
import 'package:app_shop_dien_tu/screens/favorite.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widegetOptions = <Widget>[
    const HomeScreen(),
    const Favorite(),
    const CartScreen(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _widegetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(0.1),
          )
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(microseconds: 400),
              tabBackgroundColor: const Color.fromARGB(255, 236, 121, 68),
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Trang chủ',
                ),
                GButton(
                  icon: LineIcons.heart,
                  text: 'Yêu thích',
                ),
                GButton(
                  icon: LineIcons.shoppingBag,
                  text: 'Giỏ hàng',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Tài khoản',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
