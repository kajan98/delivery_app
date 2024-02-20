import 'package:delivery_app/Screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget appbar() {
  return AppBar(
    automaticallyImplyLeading: false,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 15),
        child: IconButton(
          onPressed: (){},
          icon: Icon(Icons.shopping_bag_outlined,size: 30,),
        ),
      ),
    ],
    leading: IconButton(
      onPressed: (){
        logout();
      },
      icon: Icon(
        Icons.logout
      ),
    ),
    backgroundColor: Colors.white,
  );
}
void logout(){
Get.to(Login());
}