import 'package:flutter/material.dart';

/// Shows the "Oops! Order Failed" dialog.
/// [onRetry] runs when the user taps "Please Try Again".
/// [onBackToHome] runs when the user taps "Back to home"; if omitted,
/// it just closes the dialog.
Future<void> showOrderFailedDialog(
  BuildContext context, {
  VoidCallback? onRetry,
  VoidCallback? onBackToHome,
}) {
  return showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (context) => _OrderFailedDialog(
      onRetry: onRetry,
      onBackToHome: onBackToHome,
    ),
  );
}

class _OrderFailedDialog extends StatelessWidget {
  static const green = Color(0xFF3BB54A);

  final VoidCallback? onRetry;
  final VoidCallback? onBackToHome;

  const _OrderFailedDialog({this.onRetry, this.onBackToHome});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Close button, top-left as in the design
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.close, size: 22),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            const SizedBox(height: 12),
            // Illustration: soft green circle behind a grocery-bag icon,
            // standing in for the design's artwork.
            Center(
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: green.withOpacity(0.12),
                ),
                alignment: Alignment.center,
                child: const Text('🛍️', style: TextStyle(fontSize: 64)),
              ),
            ),
            const SizedBox(height: 24),
            const Center(
              child: Text(
                'Oops! Order Failed',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'Something went terribly wrong.',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
            ),
            const SizedBox(height: 28),
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
                  onRetry?.call();
                },
                child: const Text(
                  'Please Try Again',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onBackToHome?.call();
                },
                child: const Text(
                  'Back to home',
                  style: TextStyle(fontSize: 17, color: Colors.black87, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}