import 'package:flutter/material.dart';
import 'package:pizza01/models/food_categories_model.dart';
import 'package:pizza01/screens/home_page_screen.dart';

import 'bottom_container.dart';

class Categories extends StatelessWidget {
  List<FoodCategoriesModel> mylist = [];

  Categories({required this.mylist});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const HomePageScreen()));
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      // backgroundColor: Colors.green,
      body: GridView.count(
        shrinkWrap: false,
        primary: false,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        crossAxisCount: 3,
        childAspectRatio: 0.8,
        children: mylist
            .map((e) => BottomContainer(
                  image: e.image!,
                  name: e.name!,
                  price: e.price!,
                ))
            .toList(),
      ),
    );
  }
}
