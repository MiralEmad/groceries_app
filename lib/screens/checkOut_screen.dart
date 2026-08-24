import 'package:flutter/material.dart';
import '../components/actionbutton.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow(
                      icon: Icons.location_on_outlined,
                      title: 'Delivery Address',
                      subtitle: 'Mirpur Dhaka, Banassre Main Rd',
                    ),
                    const Divider(height: 32),
                    _buildInfoRow(
                      icon: Icons.credit_card,
                      title: 'Payment',
                      subtitle: 'Master Card **** 4679',
                    ),
                    const Divider(height: 32),
                    _buildInfoRow(
                      icon: Icons.local_offer_outlined,
                      title: 'Promo Code',
                      subtitle: 'No Promo Code Applied',
                    ),
                    const Divider(height: 32),
                    _summaryRow('Sub-total', '\$13.97'),
                    _summaryRow('Delivery', 'Free'),
                    const Divider(height: 32),
                    _summaryRow('Total', '\$13.97', bold: true),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            _buildPlaceOrderButton(),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 18),
            onPressed: () => Navigator.maybePop(context),
          ),
          const Text(
            'Checkout',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFF3F3F3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.black87),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ],
          ),
        ),
        const Icon(Icons.chevron_right, color: Colors.grey),
      ],
    );
  }

  Widget _summaryRow(String label, String value, {bool bold = false}) {
    final style = TextStyle(
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      fontSize: bold ? 16 : 14,
      color: bold ? Colors.black : Colors.grey.shade700,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(value, style: style),
        ],
      ),
    );
  }

 Widget _buildPlaceOrderButton() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: PrimaryActionButton(
      label: 'Place Order',
      onPressed: () {},
    ),
  );
}
}

