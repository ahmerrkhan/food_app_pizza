import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pizza01/models/categories_model.dart';
import 'package:pizza01/models/food_categories_model.dart';
import 'package:pizza01/models/food_model.dart';

import '../models/food_categories_model.dart';

class MyProvider extends ChangeNotifier {
  //////////////1st Category///////////////////////////
  List<CategoriesModel> burgerList = [];
  CategoriesModel? burgerModel;

  Future<void> getBurgerCategory() async {
    List<CategoriesModel> newBurgerList = [];
    QuerySnapshot querySnaphot = await FirebaseFirestore.instance
        .collection("categories")
        .doc("2q5gX0g4DDgyft3G8dg9")
        .collection("burger")
        .get();
    for (var element in querySnaphot.docs) {
      burgerModel = CategoriesModel(
        name: element['name'],
        image: element['image'],
      );
      print(burgerModel!.name);
      newBurgerList.add(burgerModel!);
      burgerList = newBurgerList;
    }
  }

  get throwBurgerList {
    return burgerList;
  }

  //////////////////2nd Category//////////////////////
  List<CategoriesModel> recipleList = [];
  CategoriesModel? recipeModel;

  Future<void> getRecipeCategory() async {
    List<CategoriesModel> newRecipeList = [];
    QuerySnapshot querySnaphot = await FirebaseFirestore.instance
        .collection("categories")
        .doc("2q5gX0g4DDgyft3G8dg9")
        .collection("Recipe")
        .get();
    for (var element in querySnaphot.docs) {
      recipeModel = CategoriesModel(
        name: element['name'],
        image: element['image'],
      );
      print(recipeModel!.name);
      newRecipeList.add(recipeModel!);
      recipleList = newRecipeList;
    }
  }

  get throwRecipeList {
    return recipleList;
  }

  ////////////////3rd category  ///////////////////////
  List<CategoriesModel> pizzaList = [];
  CategoriesModel? pizzaModel;

  Future<void> getPizzaCategory() async {
    List<CategoriesModel> newPizzaList = [];
    QuerySnapshot querySnaphot = await FirebaseFirestore.instance
        .collection("categories")
        .doc("2q5gX0g4DDgyft3G8dg9")
        .collection("Pizza")
        .get();
    for (var element in querySnaphot.docs) {
      pizzaModel = CategoriesModel(
        name: element['name'],
        image: element['image'],
      );
      print(pizzaModel!.name);
      newPizzaList.add(pizzaModel!);
      pizzaList = newPizzaList;
    }
  }

  get throwPizzaList {
    return pizzaList;
  }

  //////////////////4th category//////////////////////
  List<CategoriesModel> barbqList = [];
  CategoriesModel? barbqModel;

  Future<void> getBarbqCategory() async {
    List<CategoriesModel> newBarbqList = [];
    QuerySnapshot querySnaphot = await FirebaseFirestore.instance
        .collection("categories")
        .doc("2q5gX0g4DDgyft3G8dg9")
        .collection("Barbq")
        .get();
    for (var element in querySnaphot.docs) {
      barbqModel = CategoriesModel(
        name: element['name'],
        image: element['image'],
      );
      print(barbqModel!.name);
      newBarbqList.add(barbqModel!);
      barbqList = newBarbqList;
    }
  }

  get throwBarbqList {
    return barbqList;
  }

  ///////////////5th category//////////////////////////

  List<CategoriesModel> drinkList = [];
  CategoriesModel? drinkModel;

  Future<void> getDrinkCategory() async {
    List<CategoriesModel> newDrinkList = [];
    QuerySnapshot querySnaphot = await FirebaseFirestore.instance
        .collection("categories")
        .doc("2q5gX0g4DDgyft3G8dg9")
        .collection("Drinks")
        .get();
    for (var element in querySnaphot.docs) {
      drinkModel = CategoriesModel(
        name: element['name'],
        image: element['image'],
      );
      print(drinkModel!.name);
      newDrinkList.add(drinkModel!);
      drinkList = newDrinkList;
    }
  }

  get throwDrinkList {
    return drinkList;
  }

  ////////////////For Single Food Item//////////////////
  List<FoodModel> foodModelList = [];
  FoodModel? foodModel;

  Future<void> getFoodList() async {
    List<FoodModel> newfoodModelList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("Foods").get();

    for (var element in querySnapshot.docs) {
      foodModel = FoodModel(
          image: element['image'],
          name: element['name'],
          price: element['price']);

      newfoodModelList.add(foodModel!);
      foodModelList = newfoodModelList;
    }
  }

  get throwFoodModelList {
    return foodModelList;
  }

  ////////bURGER CATEGORIES List///////////

  List<FoodCategoriesModel> burgerCategoriesList = [];
  FoodCategoriesModel? burgerCategoriesModel;

  Future<void> getBurgerCategoriesList() async {
    List<FoodCategoriesModel> newburgerCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("foodCategories")
        .doc('SBjKb8uBV6WMLbwTk1Io ')
        .collection('burgers')
        .get();
    for (var element in querySnapshot.docs) {
      burgerCategoriesModel = FoodCategoriesModel(
          image: element['image'],
          name: element['name'],
          price: element['price']);
    }
    newburgerCategoriesList.add(burgerCategoriesModel!);
    burgerCategoriesList = newburgerCategoriesList;
    print(burgerCategoriesModel!.name);
  }

  get throwBUrgerCategoriesList {
    return burgerCategoriesList;
  }

  /////recipe category list///////////
  ////////bURGER CATEGORIES List///////////

  List<FoodCategoriesModel> recipeCategoriesList = [];
  FoodCategoriesModel? recipeCategoriesModel;

  Future<void> getRecipeCategoriesList() async {
    List<FoodCategoriesModel> newRecipeCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("foodCategories")
        .doc('SBjKb8uBV6WMLbwTk1Io ')
        .collection('recipe')
        .get();
    for (var element in querySnapshot.docs) {
      recipeCategoriesModel = FoodCategoriesModel(
          image: element['image'],
          name: element['name'],
          price: element['price']);
    }
    newRecipeCategoriesList.add(recipeCategoriesModel!);
    recipeCategoriesList = newRecipeCategoriesList;
    print(recipeCategoriesModel!.name);
  }

  get throwRecipeCategoriesList {
    return recipeCategoriesList;
  }
}
