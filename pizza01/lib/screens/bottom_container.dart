import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  final String? image;
  final String? name;
  final int? price;
  const BottomContainer(
      {required this.image, required this.name, required this.price, Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: 220,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 87, 79, 79),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 85.0,
            backgroundImage: NetworkImage(image!),
          ),
          ListTile(
            leading: Text(
              name!,
              style: const TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            trailing: Text(
              "\$ $price",
              style: const TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.star,
                  size: 20.0,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20.0,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20.0,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20.0,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20.0,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
