import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? hintText;
  final IconData? myIcon;
  final bool? obsText;
  final TextEditingController? controller;
  const MyTextField(
      {@required this.myIcon,
      @required this.hintText,
      @required this.obsText,
      @required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        style: const TextStyle(
          color: Colors.white,
        ),
        obscureText: obsText!,
        decoration: InputDecoration(
            prefix: Icon(
              myIcon,
              color: Colors.white,
            ),
            prefixIconConstraints:
                const BoxConstraints(minWidth: 15.0, maxWidth: 15.0),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey))));
  }
}
