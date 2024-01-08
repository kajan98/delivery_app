
import 'package:delivery_app/Pages/Burger.dart';
import 'package:delivery_app/Pages/combo.dart';
import 'package:delivery_app/Pages/drinks.dart';
import 'package:delivery_app/Pages/others.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  final Function(String) onCategoryTap;

  const CategoriesWidget({Key? key, required this.onCategoryTap}) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  String selectedCategory = '';
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCategory('Burger', 'Assets/logo.jpeg' ),
          _buildCategory('Snacks', 'Assets/logo.jpeg'),
          _buildCategory('Drinks', 'Assets/logo.jpeg'),
          _buildCategory('Combos', 'Assets/logo.jpeg'),

          // Add more categories as needed
        ],
      ),
    );
  }

  Widget _buildCategory(String categoryName, String imagePath) {
    bool isSelected = selectedCategory == categoryName;

    return GestureDetector(
      onTap: () {
        widget.onCategoryTap(categoryName);
        setState(() {
          selectedCategory = categoryName;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              categoryName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isSelected ? Colors.blueAccent : Color(0xFF4C53A5),
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: 2,
              width: 40,
              color: isSelected ? Colors.blueAccent : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}


class CategoryContent extends StatelessWidget {
  final String category;

  const CategoryContent(this.category);

  @override
  Widget build(BuildContext context) {
    // Return the corresponding widget based on the selected category
    if (category == 'Burger') {
      return burger();
    } else if (category == 'Drinks') {
      return drinks();
    } else if (category == 'Combos') {
      return combos();
    } else if (category == 'Snacks') {
      return others();
    } else {
      return burger();
    }
  }
}
