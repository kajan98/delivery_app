import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Icon(
            Icons.menu,
            size: 30,
            color: Color(0xFF4c53A5),
          ),
          Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Mr Burger",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4c53A5),
                ),
              )),
          Spacer(),
          Badge(
            padding: EdgeInsets.all(7),
            child: InkWell(
              onTap: () {},
              child: Icon(Icons.shopping_bag_outlined,
              size: 35,),
            ),
          ),
        ],
      ),
    );
  }
}
