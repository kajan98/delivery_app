import 'package:flutter/material.dart';

class combos extends StatefulWidget {
  const combos({super.key});

  @override
  State<combos> createState() => _combosState();
}

class _combosState extends State<combos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular combo',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text('Burger 1'),
          Text('Burger 2'),
          Text('Burger 3'),
          // Add more burger items as needed
        ],
      ),
    );
  }
}
