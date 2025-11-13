import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 8, 2, 26),
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 8, 2, 26),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign Up",
              style: TextStyle(
                color: Color.fromARGB(255, 120, 87, 180),
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),

            TextField(
              controller: emailController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(color: Colors.white54),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: passwordController,
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.white54),
              ),
            ),
            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );

                  Get.back();
                } catch (e) {
                  ScaffoldMessenger.of(
                    // ignore: use_build_context_synchronously
                    context,
                  ).showSnackBar(SnackBar(content: Text("Error: $e")));
                }
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 120, 87, 180),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "Create Account",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
