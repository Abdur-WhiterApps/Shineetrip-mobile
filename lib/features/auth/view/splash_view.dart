import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/login');
    });

    return Scaffold(
      backgroundColor: const Color(0xFFC9A24D),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 140,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: const Text(
              "SHINEE TRIP",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                letterSpacing: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
