import 'package:delivery_app/Screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("User"),
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
