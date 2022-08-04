import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pizza01/screens/signup_screen.dart';
import 'package:pizza01/screens/welcome_screen.dart';
import 'package:pizza01/widgets/my_text_field.dart';

class LoginScreen extends StatefulWidget {
  //this is regular expression for email validation
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  RegExp regExp = RegExp(LoginScreen.pattern.toString());
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  UserCredential? userCredential;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  //FUNCTION for login
  Future loginAuth() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text, password: password.text);

      Navigator.pushNamed(context, 'HomePageScreen');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        globalKey.currentState!.showSnackBar(
            const SnackBar(content: Text('No user found for that email.')));
      } else if (e.code == 'wrong-password') {
        globalKey.currentState!.showSnackBar(const SnackBar(
            content: Text('Wrong password provided for that user.')));
        setState(() {
          loading = false;
        });
      }
      setState(() {
        loading = false;
      });
    }
  }

  //function for validation
  void validation() {
    if (email.text.trim().isEmpty && password.text.trim().isEmpty) {
      globalKey.currentState!.showSnackBar(
          const SnackBar(content: Text("Both fields are empty!")));
      return;
    }

    if (email.text.trim().isEmpty) {
      globalKey.currentState!.showSnackBar(
        const SnackBar(
          content: Text("Email is empty"),
        ),
      );
      return;
    } else if (!regExp.hasMatch(email.text)) {
      globalKey.currentState!.showSnackBar(
        const SnackBar(
          content: Text("Please enter a valid email"),
        ),
      );
      return;
    }
    if (password.text.trim().isEmpty) {
      globalKey.currentState!.showSnackBar(
        const SnackBar(
          content: Text('Password is empty'),
        ),
      );
      return;
    } else {
      setState(() {
        loading = true;
      });
      loginAuth();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return const WelcomeScreen();
              }));
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 300.0),
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 45.0),
              ),
            ),
            const SizedBox(
              height: 60.0,
            ),
            Column(
              children: [
                MyTextField(
                    controller: email,
                    myIcon: Icons.person_outline,
                    hintText: "Username",
                    obsText: false),
                const SizedBox(
                  height: 30.0,
                ),
                MyTextField(
                    controller: password,
                    myIcon: Icons.security_outlined,
                    hintText: "Password",
                    obsText: true),
                const SizedBox(
                  height: 40.0,
                ),
                loading
                    ? const CircularProgressIndicator(
                        color: Colors.red,
                      )
                    : customButton(),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "New User ?",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    const SizedBox(width: 10.0),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return const SignupScreen();
                        }));
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

// for login button
  Container customButton() {
    return Container(
      height: 50.0,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.0), color: Colors.red),
      child: MaterialButton(
        onPressed: () {
          validation();
        },
        child: const Text(
          "Login",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }
}
