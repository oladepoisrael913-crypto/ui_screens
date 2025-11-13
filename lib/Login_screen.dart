import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:my_app/Home_screen.dart';
import 'SignUp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;
  bool _obscurePassword = true; // for toggle

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> loginUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.off(() => const HomeScreen());
    } on FirebaseAuthException catch (e) {
      String message = 'Authentication failed';
      if (e.code == 'user-not-found') {
        message = 'No user found for this email.';
      } else if (e.code == 'wrong-password') {
        message = 'Incorrect password.';
      } else if (e.code == 'invalid-email') {
        message = 'Invalid email format.';
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred, try again.')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 2, 26),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 8, 2, 26),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 120, 87, 180),
              ),
            ),
            const SizedBox(height: 40),

            // Email field
            CustomInputField(
              label: "Email",
              controller: emailController,
              icon: Icons.email_outlined,
            ),

            const SizedBox(height: 30),

            // Password field with toggle
            TextField(
              controller: passwordController,
              obscureText: _obscurePassword,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: Colors.white54,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white70,
                  ),
                  onPressed: () {
                    setState(() => _obscurePassword = !_obscurePassword);
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: _isLoading ? null : loginUser,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 120, 87, 180),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: _isLoading
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        "Log in",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
              ),
            ),
            TextButton(
              onPressed: () => Get.to(() => const SignupScreen()),
              child: Text(
                "Don't have an account? Sign Up here",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            // const SizedBox(height: 20),

            // Center(
            //   child: TextButton(
            //     onPressed: () => Get.to(() => const SignupScreen()),
            //     child: const Text(
            //       "Don't have an account? Sign Up",
            //       style: TextStyle(color: Colors.white70),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

// Custom field for email input
class CustomInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final IconData? icon;

  const CustomInputField({
    super.key,
    required this.label,
    required this.controller,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: label,
        hintStyle: const TextStyle(color: Colors.white54),
        prefixIcon: icon != null
            ? Icon(icon, color: Colors.white54)
            : const SizedBox(),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
