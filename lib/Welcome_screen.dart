import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Login_screen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 8, 2, 26),
      body: Padding(
        padding: const EdgeInsets.only(top: 300),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(),
                child: const Text(
                  "h' Hitech",
                  style: TextStyle(
                    fontSize: 45,
                    color: Color.fromARGB(255, 120, 87, 180),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 300),
              Center(
                // child: Padding(
                //   padding: const EdgeInsets.only(bottom: 100),
                child: Center(
                  child: Text(
                    "Inspiring Tech Solutions for a Brighter future ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to((LoginScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 120, 87, 180),
                        ),
                        child: Center(
                          child: const Text(
                            "Get Started",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // TextButton(
              //   onPressed: () => Get.to(() => const SignupScreen()),
              //   child: Text(
              //     "Don't have an account? Sign Up",
              //     style: TextStyle(
              //       color: const Color.fromARGB(255, 199, 163, 97),
              //       fontSize: 15,
              //     ),
              //   ),
              // ),
              // SizedBox(height: 10),
              // Padding(
              //   padding: const EdgeInsets.only(top: 200),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Get.to((SignupScreen()));
              //     },
              //     child: const Text("Sign Up"),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
