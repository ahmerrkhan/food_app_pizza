import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pizza01/provider/my_provider.dart';
import 'package:pizza01/screens/home_page_screen.dart';
import 'package:pizza01/screens/login_screen.dart';
import 'package:pizza01/screens/signup_screen.dart';
import 'package:pizza01/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pizza 01',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xff2b2b2b)),
        ),
        //home: const WelcomeScreen(),
        initialRoute: 'WelcomeScreen',
        routes: {
          'WelcomeScreen': (context) => const WelcomeScreen(),
          'SignupScreen': (context) => const SignupScreen(),
          'LoginScreen': (context) => const LoginScreen(),
          'HomePageScreen': (context) => const HomePageScreen(),
        },
      ),
    );
  }
}
