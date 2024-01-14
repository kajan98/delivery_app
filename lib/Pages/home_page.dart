import 'package:delivery_app/Controller/home_controller.dart';
import 'package:delivery_app/Pages/add_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Welcome"),
        ),
      );
    });
  }
}
