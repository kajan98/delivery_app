import 'package:delivery_app/Widget/CategoriesWidget.dart';
import 'package:delivery_app/Widget/HomeAppBar.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          HomeAppBar(),
          Container(
            height: deviceHeight,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                ),
                CategoriesWidget(onCategoryTap: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                }),
                SizedBox(height: 20),
                if (selectedCategory.isNotEmpty)
                  CategoryContent(selectedCategory),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




