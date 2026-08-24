import 'package:flutter/material.dart';
import '../components/actionbutton.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.network(
            'https://images.unsplash.com/photo-1506484381205-f7945653044d?w=800',
            fit: BoxFit.cover,
          ),
          // Dark gradient overlay for readability
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.75),
                ],
              ),
            ),
          ),
          // Foreground content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/carrot.png'),
                  const SizedBox(height: 16),
                  const Text(
                    'Welcome',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    'to our store',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Get your groceries in as fast as one hour',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 28),
                  PrimaryActionButton(
                   label: 'Get Started',
                   onPressed: () {
                   Navigator.pushReplacementNamed(context, '/login');
                  },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
