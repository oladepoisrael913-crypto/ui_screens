import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:my_app/Home_screen.dart';
import 'package:my_app/firebase_options.dart';
import 'package:my_app/SignUp_screen.dart';
import 'package:my_app/Login_screen.dart';
import 'Welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/WelcomeScreen',

      getPages: [
        GetPage(name: '/WelcomeScreen', page: () => const Homescreen()),
        GetPage(name: '/LoginScreen', page: () => const LoginScreen()),
        GetPage(name: '/SignUpScreen', page: () => const SignupScreen()),
        GetPage(name: '/Homescreen', page: () => const HomeScreen()),
      ],
    );
  }
}
