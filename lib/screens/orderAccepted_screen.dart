import 'package:flutter/material.dart';
import '../components/actionbutton.dart';

/// Order Accepted Screen
/// Success confirmation shown after an order has been placed, with
/// a checkmark icon, message, and a "Track Order" button.
class OrderAcceptedScreen extends StatelessWidget {
  const OrderAcceptedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  color: Color(0xFFE0F5E0),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 64,
                ),
              ),
              SizedBox(height: 66.67),
              Text(
                'Your Order has been accepted', 
                textAlign: TextAlign.center,
                style: TextStyle(
                 fontSize: 28,
                 fontWeight: FontWeight(600),
                ),
                 ), 
                 
              SizedBox(height: 20),
              Text(
                'Your items has been placed and is on\nit\'s way to being processed',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff7C7C7C), fontSize: 16 , fontWeight: FontWeight(600), height: 1.4),
              ),
              const SizedBox(height: 134.83),
              PrimaryActionButton(
                 label: 'Track Order',
                 onPressed: () {
                 Navigator.pushReplacementNamed(context, '/home');
                 },
                ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Back to Home',
                  style: TextStyle(color: Color(0xff181725), fontSize:18 ,fontWeight:  FontWeight.w600),
                ),
              ),
            ]
          ),
        ),
      )
      );
  }
}

