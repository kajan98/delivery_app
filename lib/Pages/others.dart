import 'package:flutter/material.dart';

class others extends StatefulWidget {
  const others({super.key});

  @override
  State<others> createState() => _othersState();
}

class _othersState extends State<others> {
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
            'Popular others',
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
