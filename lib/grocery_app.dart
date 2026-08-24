import 'package:flutter/material.dart';
import 'package:login/screens/account_screen.dart';
import 'package:login/screens/beverages_screen.dart';
import 'package:login/screens/checkOut_screen.dart';
import 'package:login/screens/favourites_screen.dart';
import 'package:login/screens/home_screen.dart';
import 'package:login/screens/login_screen.dart';
import 'package:login/screens/onboarding_screen.dart';
import 'package:login/screens/orderAccepted_screen.dart';
import 'package:login/screens/search_screen.dart';
import 'package:login/screens/signup_screen.dart';
import 'package:login/screens/splash_screen.dart';



class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : HomeScreen(),
    );
    
}
}