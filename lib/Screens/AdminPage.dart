import 'package:delivery_app/Screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin"),
        leading: IconButton(
          icon: Icon(Icons.logout_outlined),
          onPressed: () {
            _logout();
          },
        ),
      ),
    );
  }
  void _logout() {
    Get.offAll(Login());
  }
}
