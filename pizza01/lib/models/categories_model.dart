import 'package:flutter/material.dart';

class CategoriesModel {
  final String? image;
  final String? name;
  final int? price;

  CategoriesModel(
      {@required this.name, @required this.image, @required this.price});
}
