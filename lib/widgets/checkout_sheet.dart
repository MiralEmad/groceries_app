import 'package:flutter/material.dart';

/// Call this to pop up the draggable "Checkout" sheet from the bottom.
/// It starts at ~55% of screen height and can be dragged up to 90%
/// or down to 30% before it snaps closed.
Future<void> showCheckoutSheet(BuildContext context, {required double total}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true, // lets the sheet grow taller than half screen
    backgroundColor: Colors.transparent,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.55,
        minChildSize: 0.32,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) {
          return _CheckoutSheetContent(
            scrollController: scrollController,
            total: total,
          );
        },
      );
    },
  );
}

class _CheckoutSheetContent extends StatefulWidget {
  final ScrollController scrollController;
  final double total;

  const _CheckoutSheetContent({
    required this.scrollController,
    required this.total,
  });

  @override
  State<_CheckoutSheetContent> createState() => _CheckoutSheetContentState();
}

class _CheckoutSheetContentState extends State<_CheckoutSheetContent> {
  static const green = Color(0xFF3BB54A);

  String deliveryMethod = 'Select Method';
  String paymentLabel = 'Select';
  String promoLabel = 'Pick discount';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // Drag handle
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 4),
            child: Container(
              width: 42,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // Title row with close button
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 12, 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Checkout',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Scrollable body - the scrollController is what makes the
          // sheet's inner content participate in the drag gesture.
          Expanded(
            child: ListView(
              controller: widget.scrollController,
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
              children: [
                _checkoutRow(
                  label: 'Delivery',
                  value: deliveryMethod,
                  onTap: () async {
                    final choice = await _pickOption(
                      context,
                      title: 'Delivery method',
                      options: const ['Standard (2-3 days)', 'Express (next day)', 'Pickup'],
                    );
                    if (choice != null) setState(() => deliveryMethod = choice);
                  },
                ),
                _checkoutRow(
                  label: 'Payment',
                  leading: Container(
                    width: 28,
                    height: 18,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A73E8),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'PAY',
                      style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                    ),
                  ),
                  value: '',
                  onTap: () async {
                    final choice = await _pickOption(
                      context,
                      title: 'Payment method',
                      options: const ['Visa •••• 4242', 'Apple Pay', 'Cash on delivery'],
                    );
                    if (choice != null) setState(() => paymentLabel = choice);
                  },
                ),
                _checkoutRow(
                  label: 'Promo Code',
                  value: promoLabel,
                  onTap: () async {
                    final choice = await _pickOption(
                      context,
                      title: 'Promo code',
                      options: const ['WELCOME10', 'FREESHIP', 'None'],
                    );
                    if (choice != null) setState(() => promoLabel = choice);
                  },
                ),
                _checkoutRow(
                  label: 'Total Cost',
                  value: '\$${widget.total.toStringAsFixed(2)}',
                  bold: true,
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13, height: 1.4),
                    children: const [
                      TextSpan(text: 'By placing an order you agree to our '),
                      TextSpan(
                        text: 'Terms',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      TextSpan(text: ' And '),
                      TextSpan(
                        text: 'Conditions',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff53B175),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Order placed 🎉')),
                      );
                    },
                    child: const Text(
                      'Place Order',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _checkoutRow({
    required String label,
    required String value,
    Widget? leading,
    bool bold = false,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
            const Spacer(),
            if (leading != null) ...[leading, const SizedBox(width: 8)],
            Text(
              value,
              style: TextStyle(
                fontSize: 15,
                fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
                color: bold ? Colors.black : Colors.grey.shade600,
              ),
            ),
            const SizedBox(width: 4),
            Icon(Icons.chevron_right, size: 20, color: Colors.grey.shade400),
          ],
        ),
      ),
    );
  }

  Future<String?> _pickOption(
    BuildContext context, {
    required String title,
    required List<String> options,
  }) {
    return showModalBottomSheet<String>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            ),
            for (final o in options)
              ListTile(
                title: Text(o),
                onTap: () => Navigator.of(context).pop(o),
              ),
          ],
        ),
      ),
    );
  }
}