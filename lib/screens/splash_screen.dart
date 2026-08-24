import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
 
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
 
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Move to onboarding screen after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/onboarding');
      }
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF53B175), // Nectar green
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Image.asset('assets/carrot.png' ),
             Center(
               child: Text(
                'nectar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                ),
                           ),
             ),
            ]
           ),
            Text(
              'online groceriet',
              style: TextStyle(
                color: Colors.white.withOpacity(0.85),
                fontSize: 20,
                letterSpacing: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
