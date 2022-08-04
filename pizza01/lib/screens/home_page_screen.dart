import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pizza01/models/categories_model.dart';
import 'package:pizza01/models/food_categories_model.dart';
import 'package:pizza01/provider/my_provider.dart';
import 'package:pizza01/screens/categories.dart';
import 'package:provider/provider.dart';
import 'package:pizza01/models/food_model.dart';

import 'bottom_container.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => HomePageScreenState();
}

class HomePageScreenState extends State<HomePageScreen> {
  //for images list
  final imgList = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
  ];
  //for image title
  final imgtitle = ["All", "Burger", "Recipe", "Pizza", "Drink"];

  //to get user info in drawer
  final myuser = FirebaseAuth.instance.currentUser;

  //list here
  List<CategoriesModel> burgerList = [];
  List<CategoriesModel> recipeList = [];
  List<CategoriesModel> pizzaList = [];
  List<CategoriesModel> barbqList = [];
  List<CategoriesModel> drinkList = [];

  //for food list
  List<FoodModel> singleFoodList = [];

  List<FoodCategoriesModel> burgerCategoriesList = [];
  List<FoodCategoriesModel> recipeCategoriesList = [];

  //for burger row

  Widget burger() {
    return Row(
      children: burgerList
          .map((e) => categoryContainer(
              image: e.image!,
              name: e.name!,
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => Categories(mylist: burgerCategoriesList)));
              }))
          .toList(),
    );
  }

  Widget recipe() {
    return Row(
      children: recipeList
          .map((e) => categoryContainer(
              image: e.image!,
              name: e.name!,
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>
                        Categories(mylist: recipeCategoriesList)));
              }))
          .toList(),
    );
  }

  Widget pizza() {
    return Row(
      children: pizzaList
          .map((e) =>
              categoryContainer(image: e.image!, name: e.name!, onTap: () {}))
          .toList(),
    );
  }

  Widget barbq() {
    return Row(
      children: barbqList
          .map((e) =>
              categoryContainer(image: e.image!, name: e.name!, onTap: () {}))
          .toList(),
    );
  }

  Widget drink() {
    return Row(
      children: drinkList
          .map((e) =>
              categoryContainer(image: e.image!, name: e.name!, onTap: () {}))
          .toList(),
    );
  }

  Widget com1() {
    return Column(
      children: singleFoodList
          .map((e) =>
              BottomContainer(image: e.image!, name: e.name!, price: e.price!))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getBurgerCategory();
    burgerList = provider.throwBurgerList;

    provider.getRecipeCategory();
    recipeList = provider.throwRecipeList;

    provider.getPizzaCategory();
    pizzaList = provider.throwPizzaList;

    provider.getBarbqCategory();
    barbqList = provider.throwBarbqList;

    provider.getDrinkCategory();
    drinkList = provider.throwDrinkList;

//for single food item
    provider.getFoodList();
    singleFoodList = provider.throwFoodModelList;

    provider.getBurgerCategoriesList();
    burgerCategoriesList = provider.throwBUrgerCategoriesList;

    provider.getRecipeCategoriesList();
    recipeCategoriesList = provider.throwRecipeCategoriesList;

    return Scaffold(
      backgroundColor: const Color(0xff2b2b2b),
      appBar: AppBar(
        elevation: 5.0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
            ),
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xff2b2b2b),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/background.jpg",
                        )),
                    color: Color(0xff2b2b2b)),
                currentAccountPicture: const CircleAvatar(
                  radius: 45.0,
                  backgroundColor: Color.fromARGB(255, 94, 94, 105),
                ),
                accountName: const Text("Muhammad Ahmer Khan"),
                accountEmail: Text(
                  myuser!.email.toString(),
                  style: const TextStyle(fontSize: 18.0),
                ),
              ),
              drawerItem("Profile", Icons.person),
              drawerItem("Cart", Icons.add_shopping_cart),
              drawerItem("Order", Icons.shop),
              const Divider(
                thickness: 1.0,
                color: Colors.white,
              ),
              const ListTile(
                // onTap: () {},
                leading: Text(
                  "Communicate with Us",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
              drawerItem("Settings", Icons.settings),
              ListTile(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, 'WelcomeScreen');
                },
                title: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: TextField(
                style: const TextStyle(color: Colors.white, fontSize: 19.0),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0)),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(111, 177, 161, 161),
                    hintText: "Enter Food you love",
                    hintStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    )),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  burger(),
                  recipe(),
                  pizza(),
                  barbq(),
                  drink(),
                  // categoryContainer("assets/images/1.png", "Burger"),
                  // categoryContainer("assets/images/2.png", "Burger"),
                  // categoryContainer("assets/images/3.png", "Burger"),
                  // categoryContainer("assets/images/4.png", "Burger"),
                  // categoryContainer("assets/images/5.png", "Burger"),
                ],
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Container(
              height: 610,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.count(
                shrinkWrap: false,
                primary: false,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                // children: [
                //   com1(),
                //   com1(),
                //   com1(),
                //   com1(),
                // ],
                children: singleFoodList
                    .map((e) => BottomContainer(
                          image: e.image!,
                          name: e.name!,
                          price: e.price!,
                        ))
                    .toList(),
                // children: [
                //   bottomContainer("BBQ Pizza", 123, "assets/images/1.png"),
                //   bottomContainer("Pizza Munch", 300, "assets/images/2.png"),
                //   bottomContainer("Italic Pizza", 146, "assets/images/3.png"),
                //   bottomContainer("Pizza Alpine", 450, "assets/images/4.png"),
                // ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryContainer(
      {@required Function()? onTap,
      @required String? image,
      @required String? name}) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(left: 7.0, right: 7.0),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(image!)),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          name!,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  ListTile drawerItem(String? title, IconData? icon) {
    return ListTile(
      onTap: () {},
      leading: Icon(
        icon!,
        color: Colors.white,
      ),
      title: Text(
        title!,
        style: const TextStyle(fontSize: 20.0, color: Colors.white),
      ),
    );
  }
}
