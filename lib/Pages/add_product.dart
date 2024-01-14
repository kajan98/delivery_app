import 'package:delivery_app/Controller/home_controller.dart';
import 'package:delivery_app/Widgets/dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('AddProduct'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Add New Product',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: const Text('Product Name'),
                    hintText: 'Enter name',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: const Text('Description'),
                    hintText: 'Enter Description',
                  ),
                  maxLines: 4,
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: const Text('Image'),
                    hintText: 'Enter Image Url',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: const Text('Price'),
                    hintText: 'Enter Price',
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                        child: DropDown(
                          items: ['Burger', 'Burger1', 'Burger3'],
                          selecteditemtext: 'Categories',
                          onSelected: (selectedValue) {
                            print(selectedValue);
                          },
                        )),
                    Flexible(
                        child: DropDown(
                          items: ['Burger', 'Burger1', 'Burger3'],
                          selecteditemtext: 'others',
                          onSelected: (selectedValue) {
                            print(selectedValue);
                          },
                        )),
                  ],
                ),
                const Text('Offer Product'),
                DropDown(
                  items: [
                    'True',
                    'False',
                  ],
                  selecteditemtext: 'Offer',
                  onSelected: (selectedValue) {
                    print(selectedValue);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                    ),
                    onPressed: () {},
                    child: Text('Add Product',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),))
              ],
            ),
          ),
        ),
      );
    });
  }
}
