import 'package:delivery_app/Screens/home_page.dart';
import 'package:delivery_app/pages/My_orders.dart';
import 'package:delivery_app/pages/cart.dart';
import 'package:delivery_app/pages/menu.dart';
import 'package:delivery_app/pages/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  List<ScreenHiddenDrawer> _screens = [];

  final mytextstyle = TextStyle(
    fontSize: 25,
    color: Colors.white,
  );
  final textstyle = TextStyle(
    fontSize: 25,
    color: Colors.white,
  );

  @override
  void initState() {
    super.initState();

    _screens = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Home',
          baseStyle: mytextstyle,
          selectedStyle: textstyle,
          colorLineSelected: Colors.white,
        ),
        HomePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Menu',
          baseStyle: mytextstyle,
          selectedStyle: textstyle,
          colorLineSelected: Colors.white,
        ),
        Menu(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'My Orders',
          baseStyle: mytextstyle,
          selectedStyle: textstyle,
          colorLineSelected: Colors.white,
        ),
        MyOrders(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Profile',
          baseStyle: mytextstyle,
          selectedStyle: textstyle,
          colorLineSelected: Colors.white,
        ),
        Profile(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      screens: _screens,
      initPositionSelected: 0,
      backgroundColorMenu: Colors.blueGrey,
      backgroundColorAppBar: Colors.white,
      slidePercent: 40,
      contentCornerRadius: 75,
      isTitleCentered: true,
      leadingAppBar: Icon(
        Icons.menu,
        size: 35,
      ),
    );
  }
}

