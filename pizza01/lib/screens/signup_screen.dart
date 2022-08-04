import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pizza01/screens/login_screen.dart';
import 'package:pizza01/widgets/my_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  //this is regular expression for email validation
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool loading = false;
  RegExp regExp = RegExp(SignupScreen.pattern.toString());
  UserCredential? userCredential;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  //function to send data to cloud firestore
  Future sendData() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text);
      Navigator.pushNamed(context, 'HomePageScreen');

      await FirebaseFirestore.instance
          .collection("userData")
          .doc(userCredential.user!.uid)
          .set({
        "firstName": firstName.text.trim(),
        "lastName": lastName.text.trim(),
        "email": email.text.trim(),
        "userid": userCredential.user!.uid.trim(),
        "password": password.text.trim(),
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        globalKey.currentState!.showSnackBar(const SnackBar(
            content: Text("'The password provided is too weak.'")));
      } else if (e.code == 'email-already-in-use') {
        globalKey.currentState!.showSnackBar(const SnackBar(
            content: Text("'The account already exists for that email.")));
      }
    } catch (e) {
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
      setState(() {
        loading = false;
      });
    }
    setState(() {
      loading = false;
    });
  }

  //for validation function
  void validation() {
    if (firstName.text.trim().isEmpty) {
      globalKey.currentState!
          .showSnackBar(const SnackBar(content: Text("First Name is empty")));
      return;
    }

    if (lastName.text.trim().isEmpty) {
      globalKey.currentState!
          .showSnackBar(const SnackBar(content: Text("Last Name is empty")));
      return;
    }

    if (email.text.trim().isEmpty) {
      globalKey.currentState!
          .showSnackBar(const SnackBar(content: Text("Email is empty")));
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
      globalKey.currentState!
          .showSnackBar(const SnackBar(content: Text("Password is empty")));
      return;
    } else {
      setState(() {
        loading = true;
      });
      sendData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: globalKey,
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios),
          ),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 250.0),
                  child: Text(
                    "Sign Up",
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
                      controller: firstName,
                      myIcon: Icons.person_outline,
                      hintText: "First Name",
                      obsText: false,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    MyTextField(
                      controller: lastName,
                      myIcon: Icons.lock_outline,
                      hintText: "Last Name",
                      obsText: false,
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    MyTextField(
                      controller: email,
                      myIcon: Icons.security_outlined,
                      hintText: "Email",
                      obsText: true,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    MyTextField(
                      controller: password,
                      myIcon: Icons.lock_outline,
                      hintText: "Password",
                      obsText: true,
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    loading
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CircularProgressIndicator(
                                color: Colors.red,
                              )
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              customButton1("Cancel", Colors.grey),
                              const SizedBox(
                                width: 10.0,
                              ),
                              customButton2("Register", Colors.red),
                            ],
                          ),
                  ],
                )
              ]),
        )));
  }

// for cancel button
  Container customButton1(String text, Color colors) {
    return Container(
      height: 50.0,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.0), color: colors),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return const LoginScreen();
          }));
        },
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }

  //for cancel button
  Container customButton2(String text, Color colors) {
    return Container(
      height: 50.0,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.0), color: colors),
      child: MaterialButton(
        onPressed: () {
          validation();
        },
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }
}
