import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Image.asset("assets/images/logo.jpg"),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Text(
                    "Welcome to Pizza 01",
                    style: TextStyle(
                        color: Colors.green[600],
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text(
                    "Order food form our restaurant and",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  const Text(
                    "Make reservation in real- time",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  customButton2(
                      "Login", const Color.fromARGB(255, 51, 160, 54)),
                  const SizedBox(
                    height: 30.0,
                  ),
                  customButton1(
                      "Sign Up", const Color.fromARGB(255, 202, 191, 191)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //fot button 2
  Container customButton2(String text, Color colors) {
    return Container(
      height: 50.0,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.0), color: colors),
      child: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, 'LoginScreen');
        },
        child: Text(text),
      ),
    );
  }

  //for button 1
  Container customButton1(String text, Color colors) {
    return Container(
      height: 50.0,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.0), color: colors),
      child: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, 'SignupScreen');
        },
        child: Text(text),
      ),
    );
  }
}
