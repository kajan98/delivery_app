import 'package:flutter/material.dart';

class burger extends StatefulWidget {
  const burger({Key? key}) : super(key: key);

  @override
  State<burger> createState() => _burgerState();
}

class _burgerState extends State<burger> {
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
            'Popular Burgers',
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


